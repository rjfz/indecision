# frozen_string_literal: true

class CreateUserSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_subjects, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :subject, null:false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
