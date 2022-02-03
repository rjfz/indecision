# frozen_string_literal: true

class Year < ApplicationRecord
  has_many :lobbies
end
