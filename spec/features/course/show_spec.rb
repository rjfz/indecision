# frozen_string_literal: true

require 'rails_helper'

describe "showing a course", type: :feature do
  include_context 'log in as a user', { course: [:view] }

  let(:course) { create(:course, name: 'Test course') }

  before { course }

  it 'contains the course name' do
    visit "/courses/#{course.id}"
    expect(page).to have_content 'Test course'
  end
end
