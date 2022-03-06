# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::AnonUser::Update::EntryPoint do
  subject { described_class.call(anon_user: anon_user) }

  let(:anon_user) { create(:anon_user) }

  before { anon_user }

  it_behaves_like 'update entrypoint', AnonUser
end
