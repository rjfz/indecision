# frozen_string_literal: true

class AddYearsReferenceToLobbies < ActiveRecord::Migration[6.1]
  def change
    add_reference :lobbies, :year, null: false, foreign_key: true, type: :uuid
  end
end
