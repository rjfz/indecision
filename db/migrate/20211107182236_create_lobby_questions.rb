# frozen_string_literal: true

class CreateLobbyQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :lobby_questions, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :lobby, null: false, foreign_key: true, type: :uuid
      t.references :question, null:false, foreign_key: true, type: :uuid
      t.string :state
      t.datetime :started_at

      t.timestamps
    end
  end
end
