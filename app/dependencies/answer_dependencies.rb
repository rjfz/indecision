# frozen_string_literal: true

class AnswerContainer
  extend Dry::Container::Mixin

  register :create_answer, Operations::Answer::Create::EntryPoint
  register :update_answer, Operations::Answer::Update::EntryPoint
end

AnswerDependencies = Dry::AutoInject AnswerContainer
