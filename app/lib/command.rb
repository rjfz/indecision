# frozen_string_literal: true

class Command
  # ?
  class << self
    def save(record)
      record.tap(&:save!)
    end

    def destroy(record)
      record.tap(&:destroy!)
    end

    def discard(record)
      record.tap(&:discard!)
    end

    def restore(record)
      record.tap(&:undiscard!)
    end
  end
end
