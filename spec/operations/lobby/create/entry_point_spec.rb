require 'rails_helper'

RSpec.describe Operations::Lobby::Create::EntryPoint do
  subject { described_class.call(params) }

  let(:params) do
    {
      lesson_id: lesson.id,
      name: name,
      room_code: room_code,
      session_date: session_date,
      state: state
    }
  end

  let(:lesson) { create(:lesson) }
  let(:name) { 'Game Design' }
  let(:room_code) { 'sjsj' }
  let(:session_date) { '12/2/2021' }
  let(:state) {'started'}

  context 'when all parameters are supplied' do
    it_behaves_like 'create entrypoint', Lobby
  end

  context 'when there are missing parameters' do
    let(:params) { {} }
    it 'raises an error' do
      expect { subject }.to raise_error(ValidationError)
    end
  end
end
