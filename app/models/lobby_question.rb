# frozen_string_literal: true

class LobbyQuestion < ApplicationRecord
  belongs_to :lobby
  belongs_to :question

  def pending?
    state == 'pending'
  end

  def starting?
    state == 'starting'
  end

  def started?
    state == 'started'
  end

  def finished?
    state == 'finished'
  end
end
