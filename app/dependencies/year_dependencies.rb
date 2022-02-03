# frozen_string_literal: true

class YearContainer
  extend Dry::Container::Mixin

  register :create_year, Operations::Year::Create::EntryPoint
end

YearDependencies = Dry::AutoInject YearContainer
