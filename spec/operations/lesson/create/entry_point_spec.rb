# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Lesson::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      course_id: course.id,
      name: name,
      number: number
    }
  end
  let(:course) { create(:course) }
  let(:name) { 'Travelling salesperson' }
  let(:number) { 1 }

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Lesson
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
