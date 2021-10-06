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
    it 'does not raise an error' do
      expect{ subject }.not_to raise_error
    end

    it 'adds a new lesson to the database' do
      expect{ subject }.to change(Lesson, :count).by(1)
    end
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect{ subject }.to raise_error(ValidationError)
    end
  end
end

