# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :lobby_question
  belongs_to :answer
  belongs_to :anon_user
end
