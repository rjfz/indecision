# frozen_string_literal: true

class Role < ApplicationRecord

  has_many :role_permissions
  has_many :users
end
