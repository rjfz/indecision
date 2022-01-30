# frozen_string_literal: true

class Presenter
  def self.from(records)
    records = [records].flatten
    presenter_klass = "Presenters::#{records.first.class.name}".constantize

    records.map { presenter_klass.new(_1)}
  end

  def initialize(record)
    @record = record
  end

  def self.call(record)
    new(record).attributes.as_json
  end

  def attributes
    raise '`attributes` cannot be called on presenter'
  end

  def method_missing(name, *args, &block)
    return attributes[name] if attributes[name]

    super
  end

  def respond_to_missing?(name, *args)
    attributes.key?(name) || super
  end

  private

  attr_reader :record
end
