# frozen_string_literal: true

class CourseContainer
  extend Dry::Container::Mixin

  register :create_course, Operations::Course::Create::EntryPoint
end

CourseDependencies = Dry::AutoInject CourseContainer
