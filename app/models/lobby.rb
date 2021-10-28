# frozen_string_literal: true

class Lobby < ApplicationRecord
  belongs_to :lesson

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
