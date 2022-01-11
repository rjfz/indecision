# frozen_string_literal: true

class Lobby < ApplicationRecord
  belongs_to :lesson
  has_many :lobby_questions
  has_many :anon_user_lobbies
  has_many :anon_users, through: :anon_user_lobbies

  after_update_commit -> { broadcast_replace_to "lobby_#{id}" }

  def pending?
    state == pending
  end

  def started?
    state == started
  end

  def finished?
    state == finished
  end

end
