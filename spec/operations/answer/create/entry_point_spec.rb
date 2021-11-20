require 'rails_helper'

RSpec.describe Operations::Answer::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      question_id: question.id,
      value: value,
      correct: correct,
    }
  end

  let(:question) { create(:question) }
  let(:value) { 'joe who' }
  let(:correct) { 'true' }

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Answer
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
