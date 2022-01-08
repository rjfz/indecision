# frozen_string_literal: true

class Lobby < ApplicationRecord
  belongs_to :lesson
  has_many :lobby_questions
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
