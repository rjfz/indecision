# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Question::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      lesson_id: lesson.id,
      title: title,
      time_limit: time_limit
    }
  end

  let(:lesson) { create(:lesson) }
  let(:title) { 'who is joe' }
  let(:time_limit) { '30' }

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Question
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
