# frozen_string_literal: true

class AnswerContainer
  extend Dry::Container::Mixin

  register :create_answer, Operations::Answer::Create::EntryPoint
end

AnswerDependencies = Dry::AutoInject AnswerContainer
