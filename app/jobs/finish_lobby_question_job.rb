# frozen_string_literal: true

class FinishLobbyQuestionJob < ApplicationJob
  include ActionView::RecordIdentifier

  queue_as :default

  def perform(lobby_question)
    @lobby_question = lobby_question
    Operations::LobbyQuestion::Update::EntryPoint.call(lobby_question: lobby_question, state: 'finished')
    if lobby_question.question.question_type != 'Open Answer'
      calculate_points
    end
    lobby_question.lobby.broadcast_replace_to(
      dom_id(lobby_question.lobby),
      target: 'response',
      partial: 'responses/no_answer',
      locals: { response: Response.new(lobby_question: lobby_question) }
    )
    responses.each do |response|
      DisplayQuestionAnswerJob.perform_now(response)
    end
  end

  private

  attr_reader :lobby_question

  def calculate_points
    if lobby_question.question.question_type == 'Quickfire'
      lobby_question.responses.correct.order(created_at: :asc).first.update(points: 15)
    else
      offset = responses.count - correct_responses.count
      data = correct_responses.map.with_index do |response, index|
        { id: response.id, points: index + offset }
      end.index_by{_1[:id]}
      Response.update(data.keys, data.values)
    end
  end

  def answer_ids
    lobby_question.question.answers.where(correct: true).ids
  end

  def responses
    @responses ||= lobby_question.responses
  end

  def correct_responses
    @correct_responses ||= responses.where(answer_id: answer_ids, created_at: lobby_question.started_at..(lobby_question.started_at + lobby_question.question.time_limit) ).order(created_at: :desc)
  end
end
