# frozen_string_literal: true

module Forms
  class Response < Form
    attribute :lobby_question_id, :uuid
    attribute :answer_id, :uuid
    attribute :user_id, :uuid
    attribute :anon_user_id, :uuid
    attribute :answer_text, :string

    validates :lobby_question_id, :anon_user_id,  presence: true
    validates :answer_id, presence: true, unless: :answer_text
    validates :answer_text, presence: true, unless: :answer_id
    validates :answer_id, absence: true, if: :answer_text
    validates :answer_text, absence: true, if: :answer_id
  end
end
