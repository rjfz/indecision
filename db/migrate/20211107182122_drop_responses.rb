# frozen_string_literal: true

class DropResponses < ActiveRecord::Migration[6.1]
  def change
    drop_table :responses
  end
end
