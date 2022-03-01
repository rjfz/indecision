# frozen_string_literal: true

class Lobby < ApplicationRecord
  belongs_to :year
  belongs_to :lesson
  has_many :lobby_questions
  has_many :anon_user_lobbies
  has_many :anon_users, through: :anon_user_lobbies

  after_update_commit -> { broadcast_replace_to "lobby_#{id}" }

  def pending?
    state == pending
  end

  def started?
    state == started
  end

  def finished?
    state == finished
  end

  def overall_response_rate
    questions = lobby_questions.includes(:question).where.not(question: { question_type: 'Quickfire' })
    responses = Response.where(lobby_question_id: questions.ids).count
    attendees = anon_users.count

    ((responses.to_f / attendees.to_f) / questions.count) * 100
  end

  def overall_correct_answer_rate
      questions = lobby_questions.includes(:question).where(question: { question_type: 'Multiple Choice' })
      answers = Answer.where(correct: true).ids
      all_responses = Response.where(lobby_question_id: questions.ids)
      correct_responses = all_responses.where(answer_id: answers)

      ((correct_responses.count.to_f / all_responses.count.to_f) * 100 )
  end


end
