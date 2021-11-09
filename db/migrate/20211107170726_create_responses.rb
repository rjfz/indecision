# frozen_string_literal: true

class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.references :lobby, null:false, foreign_key: true, type: :uuid
      t.references :answer, null:false , foreign_key: true, type: :uuid
      t.timestamps
  end
end
end
