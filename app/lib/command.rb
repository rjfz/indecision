class Command

  class << self  #?

    def save(record)
      record.tap(&:save!)
    end

    def discard(record)
      record.tap(&:discard!)
    end

    def restore(record)
      record.tap(&:undiscard!)
    end


  end

end
