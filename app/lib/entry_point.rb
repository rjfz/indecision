# frozen_string_literal: true

module EntryPoint
  extend ActiveSupport::Concern

  def call
    form&.valid!
    ActiveRecord::Base.transaction do
      action.call
    end
  end

  included do
    attr_accessor :form, :action
  end

  class_methods do
    def call(*args)
      new(*args).call
    end
  end
end
