# frozen_string_literal: true

module Presenters
  class LobbyQuestion < Presenter
    def attributes
      {
        lobby: Presenters::Lobby.new(record.lobby),
        id: record.id,
        question: Presenters::Question.new(record.question),
        state: record.state,
        datetime: record.started_at
      }
    end
  end
end
