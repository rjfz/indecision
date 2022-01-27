# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Lobby::Update::EntryPoint do
  subject { described_class.call(lobby: lobby, **params) }

  let(:lobby) { create(:lobby, state: 'pending') }
  let(:params) do
    {
      state: state
    }
  end

  let(:state) { 'started' }


  describe 'updating state' do
    it 'stores the updated state' do
      subject
      expect(lobby.reload.state).to eq state
    end
  end
end
