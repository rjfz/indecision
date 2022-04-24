require 'rails_helper'

RSpec.describe Component::Question::Form, type: :component do

  let(:lesson) { create :lesson, id: '07fdb82c-422c-48f1-8ee5-72566ef2cd6b'}

  before { lesson }

  context 'when an question is provided' do
    subject { described_class.new(question: question) }

    let(:question) do
      create(
        :question,
        lesson_id: '07fdb82c-422c-48f1-8ee5-72566ef2cd6b',
        title: 'Froganomics',
        time_limit: '25'
      )
    end

    it_behaves_like 'a field with value', :question, :lesson, nil
    it_behaves_like 'a field with value', :question, :title, 'Froganomics'
    it_behaves_like 'a field with value', :question, :time_limit, '25'

  end
end


