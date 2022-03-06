# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Question::Update::EntryPoint do
  subject { described_class.call(question: question, **params) }

  let(:params) do
    {
      lesson_id: lesson.id,
      title: title,
      time_limit: time_limit
    }
  end
  let(:question) { create(:question)}
  let(:lesson) { create(:lesson) }
  let(:title) { 'who is joe' }
  let(:time_limit) { '30' }

  before { question }

  it_behaves_like 'update entrypoint', Question
end
