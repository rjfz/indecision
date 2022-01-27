# frozen_string_literal: true

class AddPointsToResponses < ActiveRecord::Migration[6.1]
  def change
      add_column :responses, :points, :integer
  end
end
