# frozen_string_literal: true

module Presenters
  class Role < Presenter
    def attributes
      {
        name: record.name,
        id: record.id
      }
    end
  end
end
