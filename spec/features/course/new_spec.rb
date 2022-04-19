# # frozen_string_literal: true

# require 'rails_helper'

# describe 'creating course', type: :feature do
#   include_context 'log in as a user', { course: [:create] }

#   let(:subject) { create(:subject) }

#   before { create(:user_subject, user: user, subject: subject) }

#   it 'contains the course name' do
#     visit '/courses/new'
#     find('#course_subject_id').find("option[value='#{subject.id}']").click
#     fill_in 'course_name', with: 'Test course'
#     fill_in 'course_module_code', with: 'CS1260'
#     click_button 'Create Course'
#     require 'pry'; binding.pry
#     expect(page).to have_content 'Test course'
#   end
# end
