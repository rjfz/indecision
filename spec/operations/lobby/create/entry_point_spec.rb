# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operations::Lobby::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      lesson_id: lesson.id,
      name: name,
      session_date: session_date,
      state: state,
      year_id: year.id
    }
  end

  let(:lesson) { create(:lesson) }
  let(:name) { 'Game Design' }
  let(:session_date) { '12/2/2021' }
  let(:state) { 'started' }
  let(:year) { create(:year) }

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Lobby
  end

  describe 'room code' do
    it 'generates a new one' do
      expect(subject.room_code).not_to be nil
    end

    it 'doesnt provide illegal values' do
      expect(subject.room_code).to match(/^[0-9A-Z]{6}$/)
    end
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
