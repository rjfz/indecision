# frozen_string_literal: true

class BlobValidator < ::ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless value.present?

    @record = record
    @attribute = attribute
    @value = value

    validate_size if options[:size_range].present?
    validate_content_type
  end

  private

  attr_reader :record, :attribute, :value

  def validate_content_type
    record.errors.add(attribute, :content_type) unless valid_content_type?
  end

  def valid_content_type?
    return true if options[:content_type].nil?

    case options[:content_type]
    when Regexp
      options[:content_type].match?(value.content_type)
    when Array
      options[:content_type].include?(value.content_type)
    else
      options[:content_type] == value.content_type
    end
  end

  def validate_size
    if options[:size_range].min > value.byte_size
      record.errors.add(attribute, :min_size_error, min_size: humanize_number(options[:size_range].min))
    elsif options[:size_range].max < value.byte_size
      record.errors.add(attribute, :max_size_error, max_size: humanize_number(options[:size_range].max))
    end
  end

  def humanize_number(number)
    ActiveSupport::NumberHelper.number_to_human_size(number)
  end
end
