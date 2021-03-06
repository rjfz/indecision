# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course
  has_many :lobbies, dependent: :destroy
  has_many :questions

  has_one_attached :image
end
