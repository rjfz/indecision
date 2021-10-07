# frozen_string_literal: true

class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.timestamps
    end
  end
end
