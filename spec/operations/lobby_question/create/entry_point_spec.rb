# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::LobbyQuestion::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      lobby_id: lobby.id,
      question_id: question.id,
      started_at: started_at,
      state: state
    }
  end

  let(:lobby) { create(:lobby) }
  let(:question) { create(:question) }
  let(:started_at) { '12/2/2021' }
  let(:state) { 'started' }

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', LobbyQuestion
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
