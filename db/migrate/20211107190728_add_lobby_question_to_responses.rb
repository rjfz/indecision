# frozen_string_literal: true

class AddLobbyQuestionToResponses < ActiveRecord::Migration[6.1]
  def change
      add_reference :responses, :lobby_question, null: false, foreign_key: true, type: :uuid
  end
end
