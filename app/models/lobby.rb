# frozen_string_literal: true

class Lobby < ApplicationRecord
  belongs_to :lesson
  has_many :lobby_questions

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
