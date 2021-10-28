# frozen_string_literal: true

module Forms
  class Answer < Form
    attribute :answer_id, :uuid
    attribute :value, :string
    attribute :correct, :boolean

    validates :answer_id, :value, presence: true
    validates :value, length: { minimum: 1, maximum: 220 }
  end
end
