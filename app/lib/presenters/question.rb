module Presenters
  class Question < Presenter


    def attributes
      {
        title: record.title,
        id: record.id,
        time_limit: record.time_limit
      }
    end

  end
end
