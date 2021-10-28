# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :lesson, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.integer :time_limit
      t.timestamps
  end
end
end
