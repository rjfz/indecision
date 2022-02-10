# frozen_string_literal: true

module Presenters
  class User < Presenter
    def attributes
      {
        role: Presenters::Role.new(record.role),
        id: record.id,
        email: record.email
      }
    end
  end
end
