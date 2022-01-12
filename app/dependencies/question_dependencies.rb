# frozen_string_literal: true

class QuestionContainer
  extend Dry::Container::Mixin

  register :create_question, Operations::Question::Create::EntryPoint
  register :update_question, Operations::Question::Update::EntryPoint
end

QuestionDependencies = Dry::AutoInject QuestionContainer
