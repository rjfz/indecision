module Presenters
  class Answer < Presenter


    def attributes
      {
        value: record.value,
        correct: record.correct
      }
    end

  end
end
