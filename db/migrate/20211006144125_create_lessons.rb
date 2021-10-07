# frozen_string_literal: true

class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :course, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
