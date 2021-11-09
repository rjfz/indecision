# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.string :value
      t.boolean :correct
      t.timestamps
  end
end
end
