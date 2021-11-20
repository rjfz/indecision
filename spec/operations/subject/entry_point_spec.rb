require 'rails_helper'

RSpec.describe Operations::Subject::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      name: "yeetus"
    }
  end

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Subject
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
