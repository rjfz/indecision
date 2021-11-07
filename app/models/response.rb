# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :lobby
  belongs_to :question
end
