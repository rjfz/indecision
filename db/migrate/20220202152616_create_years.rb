# frozen_string_literal: true

class CreateYears < ActiveRecord::Migration[6.1]
  def change
    create_table :years, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :academic_year

      t.timestamps
    end
  end
end
