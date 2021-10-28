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

  def with(object)
    object_attributes = object.attributes.symbolize_keys
    assignable_attributes = object_attributes.keys & attributes.keys
    assign_attributes(
      **object_attributes.select do |attribute, _value|
        assignable_attributes.include?(attribute) && public_send(attribute).nil?
      end
    )
    self
  end

  def attributes
    super.symbolize_keys
  end
end
