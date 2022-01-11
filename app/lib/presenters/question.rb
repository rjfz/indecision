# frozen_string_literal: true

module Presenters
  class Question < Presenter
    def attributes
      {
        title: record.title,
        id: record.id,
        time_limit: record.time_limit,
        answers: record.answers
      }
    end
  end
end
