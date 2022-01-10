class AnonUserLobby < ApplicationRecord
  belongs_to :lobby
  belongs_to :anon_user

  has_many :responses
  after_create_commit -> { broadcast_append_to "lobby_#{lobby.id}_anon_users" }
end
