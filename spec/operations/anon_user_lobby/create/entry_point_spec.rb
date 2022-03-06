# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::AnonUserLobby::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      lobby_id: lobby.id,
      anon_user_id: anon_user.id
    }
  end

  let(:lobby){create(:lobby)}
  let(:anon_user){create(:anon_user)}

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', AnonUserLobby
  end
end
