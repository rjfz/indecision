# frozen_string_literal: true

module Forms
  class Lobby < Form
    attribute :lesson_id, :uuid
    attribute :session_date, :datetime
    attribute :name, :string
    attribute :state, :string, default: 'pending'
    attribute :year_id, :uuid
    attribute :image, :upload

    validates :lesson_id, :session_date, :name, :year_id, presence: true

  end
end
