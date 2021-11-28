# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Course::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      subject_id: program.id,
      name: name,
      module_code: module_code
    }
  end
  let(:program) { create(:subject) }
  let(:name) { 'Game Design' }
  let(:module_code) { 'CS0121' }

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Course
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
