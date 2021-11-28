# frozen_string_literal: true

module Forms
  class Response < Form
    attribute :lobby_question_id, :uuid
    attribute :answer_id, :uuid
    attribute :user_id, :uuid

    validates :answer_id, :lobby_question_id, presence: true
  end
end
