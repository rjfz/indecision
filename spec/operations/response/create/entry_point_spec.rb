# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Response::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      lobby_question_id: lobby_question.id,
      answer_id: answer.id,
      user_id: user.id


    }
  end
  let(:lobby_question) { create(:lobby_question) }
  let(:answer) { create(:answer) }
  let(:user) { create(:user) }

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Response
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
