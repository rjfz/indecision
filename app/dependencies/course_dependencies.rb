# frozen_string_literal: true

class CourseContainer
  extend Dry::Container::Mixin

  register :create_course, Operations::Course::Create::EntryPoint
  register :update_course, Operations::Course::Update::EntryPoint
end

CourseDependencies = Dry::AutoInject CourseContainer
