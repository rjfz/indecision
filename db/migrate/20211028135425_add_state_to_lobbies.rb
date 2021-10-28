# frozen_string_literal: true

class AddStateToLobbies < ActiveRecord::Migration[6.1]
  def change
    add_column :lobbies, :state , :string
  end
end
