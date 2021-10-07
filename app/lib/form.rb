# frozen_string_literal: true

class Form
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :uuid
  attribute :created_at, :datetime
  attribute :updated_at, :datetime

  def valid!
    raise ValidationError, errors.full_messages.join(', ') unless valid?
  end

  def attributes
    super.symbolize_keys
  end
end
