# frozen_string_literal: true

module Presenters
  class Subject < Presenter
    def attributes
      {
        name: record.name
      }
    end
  end
end
