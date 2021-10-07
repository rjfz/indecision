# frozen_string_literal: true

class UniquenessValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    model = model_for record

    conditions = generate_conditions(record, attribute, value)

    matching_records = model.where(conditions)

    return if matching_records.count.zero?
    return if matching_records.count == 1 && matching_records.first.id == record.id

    record.errors.add(attribute, "#{msg} - record: #{record.inspect}, value: #{value.inspect}")
  end

  def generate_conditions(record, attribute, value)
    { attribute => value }.tap do |conditions|
      conditions.merge!(generate_scopes(options[:scope], record)) if options[:scope]
    end
  end

  def generate_scopes(scopes, record)
    {}.tap do |conditions|
      scopes = [scopes].flatten
      scopes.each do |scope|
        conditions[scope] = record.public_send(scope.to_sym)
      end
    end
  end

  def msg
    options[:message] || 'is not unique'
  end

  def model_for(record)
    record.class.name.demodulize.constantize
  end

end
