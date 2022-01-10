# frozen_string_literal: true

class NameGeneratorContainer
  extend Dry::Container::Mixin

  register :generate_name, Operations::NameGenerator::Create::EntryPoint
end

NameGeneratorDependencies = Dry::AutoInject NameGeneratorContainer
