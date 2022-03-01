# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course
  has_many :lobbies, dependent: :destroy
  has_many :questions

  has_one_attached :image

  def overall_response_rate

    questions = lessons.map(&:lobby_questions).flatten.includes(:question).where.not(question: { question_type: 'Quickfire' })
    responses = Response.where(lobby_question_id: questions.ids).count
    attendees = anon_users.count

    ((responses.to_f / attendees.to_f) / questions.count) * 100
  end

  def overall_correct_answer_rate

    questions = lessons.map(&:lobby_questions).flatten.includes(:question).where(question: { question_type: 'Multiple Choice' })
    answers = Answer.where(correct: true).ids
    all_responses = Response.where(lobby_question_id: questions.ids)
    correct_responses = all_responses.where(answer_id: answers)

    ((correct_responses.count.to_f / all_responses.count.to_f) * 100 )
end
end
