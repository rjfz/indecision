# frozen_string_literal: true

module Forms
  class LobbyQuestion < Form
    attribute :lobby_id, :uuid
    attribute :question_id, :uuid
    attribute :state, :string, default: 'pending'
    attribute :started_at, :datetime, default: Time.now

    validates :lobby_id, :question_id, :state, :started_at, presence: true
    validates :state, inclusion: { in: %w[pending starting started finished] }
  end
end
