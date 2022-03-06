# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::NameGenerator::Create::EntryPoint do
  subject { described_class.call() }

  context 'when name generator is called' do
    it 'generates a string' do
      expect(subject ).to be_an_instance_of String
    end
  end
end
