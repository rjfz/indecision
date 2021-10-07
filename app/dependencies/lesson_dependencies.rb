# frozen_string_literal: true

class LessonContainer
  extend Dry::Container::Mixin

  register :create_lesson, Operations::Lesson::Create::EntryPoint
end

LessonDependencies = Dry::AutoInject LessonContainer
