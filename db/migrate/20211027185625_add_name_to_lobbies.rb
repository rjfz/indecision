# frozen_string_literal: true

class AddNameToLobbies < ActiveRecord::Migration[6.1]
  def change
    add_column :lobbies, :name , :string
  end
end
