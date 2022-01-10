# frozen_string_literal: true

module Forms
  class AnonUserLobby < Form
    attribute :lobby_id, :uuid
    attribute :anon_user_id, :uuid
    validates :lobby_id, :anon_user_id, presence: true
  end
end
