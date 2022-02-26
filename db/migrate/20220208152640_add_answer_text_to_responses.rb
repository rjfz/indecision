# frozen_string_literal: true

class AddAnswerTextToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :answer_text, :string, null: true
  end
end
