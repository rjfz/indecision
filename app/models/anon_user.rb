class AnonUser < ApplicationRecord
  has_many :anon_user_lobbies
  has_many :lobbies, through: :anon_user_lobbies
  has_many :responses
  has_many :answers, through: :responses
end

