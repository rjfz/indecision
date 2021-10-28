# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :lesson
  has_many :answers
end
