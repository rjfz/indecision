# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Year::Create::EntryPoint do
  subject { described_class.call(params) }


  let(:params) { { academic_year: '2020-2021' } }


  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Year
  end
end
