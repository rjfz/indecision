# frozen_string_literal: true

class AddQuestionTypeToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :question_type, :string, null: false
  end
end
