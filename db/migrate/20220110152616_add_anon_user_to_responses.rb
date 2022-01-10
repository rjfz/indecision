# frozen_string_literal: true

class AddAnonUserToResponses < ActiveRecord::Migration[6.1]
  def change
      add_reference :responses, :anon_user, null: false, foreign_key: true, type: :uuid
  end
end
