# frozen_string_literal: true

class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject

end
