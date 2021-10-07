# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :subject

  has_many :lessons
end
