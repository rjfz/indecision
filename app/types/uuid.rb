# frozen_string_literal: true

class Uuid < ActiveModel::Type::String

  UUID_FORMAT = /\A[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[89ab][\da-f]{3}-[\da-f]{12}\z/i.freeze

  def cast(value)
    return nil unless value =~ UUID_FORMAT

    value
  end

end
