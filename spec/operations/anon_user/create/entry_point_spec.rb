# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::AnonUser::Create::EntryPoint do
  subject { described_class.call() }

  let(:anon_user) { create(:anon_user) }


  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', AnonUser
  end

end
