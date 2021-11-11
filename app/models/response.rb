# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :lobby_question
  belongs_to :answer
end
