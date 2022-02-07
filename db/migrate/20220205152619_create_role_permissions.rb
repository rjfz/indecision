# frozen_string_literal: true

class CreateRolePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :role_permissions, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :role, null: false, foreign_key: true, type: :uuid
      t.string :resource
      t.string :action

      t.timestamps
    end
  end
end
