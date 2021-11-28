# frozen_string_literal: true

module Presenters
  class Course < Presenter
    def attributes
      {
        name: record.name,
        subject: Presenters::Subject.new(record.subject).name,
        module_code: record.module_code,
        id: record.id,
        summary: "#{record.name} - #{record.module_code}"
      }
    end
  end
end
