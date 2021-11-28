# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::LobbyQuestion::Update::EntryPoint do
  subject { described_class.call(lobby_question: lobby_question, **params) }

  let(:lobby_question) { create(:lobby_question, state: 'pending') }
  let(:params) do
    {
      state: state
    }
  end

  let(:state) { 'starting' }

  describe 'updating state' do
    it 'stores the updated state' do
      subject
      expect(lobby_question.reload.state).to eq state
    end
    it 'queues StartLobbyQuestionJob' do
      expect { subject }.to have_enqueued_job(StartLobbyQuestionJob).with lobby_question
    end
  end
end
