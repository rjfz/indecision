# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :courses
  has_many :user_subjects
  has_many :users, through: :user_subjects
end
