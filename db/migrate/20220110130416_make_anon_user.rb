# frozen_string_literal: true

class MakeAnonUser < ActiveRecord::Migration[6.1]
  def change
    create_table :anon_users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :username
      t.timestamps
    end
  end
end
