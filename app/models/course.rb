class Course < ApplicationRecord
  belongs_to :subject

  has_many :lessons
end
