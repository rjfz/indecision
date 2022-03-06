# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::User::Update::EntryPoint do
  subject { described_class.call(user: user) }


  let(:user) { create(:user) }

  before { user }

  it_behaves_like 'update entrypoint', User
end
