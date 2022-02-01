# frozen_string_literal: true

class RemoveLobbyAndQuestionFromResponses < ActiveRecord::Migration[6.1]
  def change
    remove_reference :responses, :lobby
    remove_reference :responses, :question
  end
end
