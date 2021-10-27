module Presenters
  class Lesson < Presenter


    def attributes
      {
        name: record.name,
        id: record.id
      }
    end

  end
end
