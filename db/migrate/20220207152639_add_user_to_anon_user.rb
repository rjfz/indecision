# frozen_string_literal: true

class AddUserToAnonUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :anon_users, :user, null: true, foreign_key: true, type: :uuid
  end
end
