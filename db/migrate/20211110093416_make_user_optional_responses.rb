# frozen_string_literal: true

class MakeUserOptionalResponses < ActiveRecord::Migration[6.1]
  def change
    change_column_null :responses, :user_id, true
  end
end
