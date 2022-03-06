# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Answer::Update::EntryPoint do
  subject { described_class.call(answer: answer, **params) }

  let(:answer) { create(:answer) }
  let(:params) { { value: 'new value' } }

  before { answer }

  it_behaves_like 'update entrypoint', Answer
end
