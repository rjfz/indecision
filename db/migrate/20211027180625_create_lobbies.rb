# frozen_string_literal: true

class CreateLobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :lobbies, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :lesson, null: false, foreign_key: true, type: :uuid
      t.string :room_code
      t.datetime :session_date

      t.timestamps
    end
  end
end
