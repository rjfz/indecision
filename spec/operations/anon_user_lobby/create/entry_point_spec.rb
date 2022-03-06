# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::AnonUserLobby::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:anon_user_lobby) { create(:anon_user_lobby) }


  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', AnonUserLobby
  end
end
