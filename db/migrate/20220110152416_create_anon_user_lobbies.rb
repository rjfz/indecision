# frozen_string_literal: true

class CreateAnonUserLobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :anon_user_lobbies, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :lobby, null: false, foreign_key: true, type: :uuid
      t.references :anon_user, null:false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
