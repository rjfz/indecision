# frozen_string_literal: true

class QuestionContainer
  extend Dry::Container::Mixin

  register :create_question, Operations::Question::Create::EntryPoint
end

QuestionDependencies = Dry::AutoInject QuestionContainer
