# frozen_string_literal: true

class MakeResponsesPointsDefaultZero < ActiveRecord::Migration[6.1]
  def change
      change_column_default :responses, :points, 0
  end
end
