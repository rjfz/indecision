# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Answer::Destroy::EntryPoint do
  subject { described_class.call(answer_id: answer.id) }

  let(:answer) { create(:answer) }

  before { answer }

  it_behaves_like 'destroy entrypoint', Answer
end
