# frozen_string_literal: true

class ChangeAnswerIdNullToTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_null :responses, :answer_id, true
  end
end
