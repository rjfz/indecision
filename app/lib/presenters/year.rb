# frozen_string_literal: true

module Presenters
  class Year < Presenter
    def attributes
      {
        academic_year: record.academic_year
      }
    end
  end
end
