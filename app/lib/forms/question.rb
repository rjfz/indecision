# frozen_string_literal: true

module Forms
  class Question < Form
    attribute :lesson_id, :uuid
    attribute :title, :string
    attribute :time_limit, :integer

    validates :lesson_id, :title, :time_limit, presence: true
    validates :title, length: { minimum: 6, maximum: 220 }
    validates :time_limit, numericality: { only_integer: true, greater_than: 0, less_than: 120 }
  end
end
