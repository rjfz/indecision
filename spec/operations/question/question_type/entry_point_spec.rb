# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Question::QuestionType::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      question: question
    }
  end


  context 'when question has no time limit' do
    let(:question) { create(:question, time_limit: 0) }

    before do
      create(:answer, question: question)
      create(:answer, question: question)
    end

    it 'sets question type to Quickfire' do
      expect(subject).to eq 'Quickfire'
    end
end

context 'when question has no answer' do
  let(:question) { create(:question, time_limit: 30) }

  it 'sets question type to Open Answer' do
    expect(subject).to eq 'Open Answer'
  end
end

context 'when question has a time limit and answers' do
  let(:question) { create(:question, time_limit: 30) }

  before do
    create(:answer, question: question)
    create(:answer, question: question)
  end

  it 'sets question type to Multiple Choice' do
    expect(subject).to eq 'Multiple Choice'
  end
end

context 'when question has no time limit and no answers' do
  let(:question) { create(:question, time_limit: 0) }

  it 'sets question type to unknown' do
    expect(subject).to eq 'Invalid'
  end
end

end
