# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :lobby_question
  belongs_to :answer, optional: true
  belongs_to :anon_user

  scope :correct, -> { where(answer_id: Answer.where(correct: true))}

end
