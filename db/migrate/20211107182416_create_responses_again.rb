# frozen_string_literal: true

class CreateResponsesAgain < ActiveRecord::Migration[6.1]
  def change
    create_table :responses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :lobby_question, null: false, foreign_key: true, type: :uuid
      t.references :answer, null:false, foreign_key: true, type: :uuid
      t.references :user, null:false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
