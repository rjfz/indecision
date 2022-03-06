# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Lesson::Update::EntryPoint do
  subject { described_class.call(lesson: lesson, **params) }

  let(:params) do
    {
      course_id: course.id,
      name: name,
      number: number
    }
  end
  let(:lesson) { create(:lesson) }
  let(:course) { create(:course) }
  let(:name) { 'Travelling salesperson' }
  let(:number) { 1 }

  before { lesson }

  it_behaves_like 'update entrypoint', Lesson
end
