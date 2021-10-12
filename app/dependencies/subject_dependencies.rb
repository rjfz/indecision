# frozen_string_literal: true

class SubjectContainer
  extend Dry::Container::Mixin

  register :create_subject, Operations::Subject::Create::EntryPoint
end

SubjectDependencies = Dry::AutoInject SubjectContainer
