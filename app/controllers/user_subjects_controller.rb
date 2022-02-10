# frozen_string_literal: true

class UserSubjectsController < AuthenticatedController
  include UserSubjectsDependencies['update_user_subject']

  before_action :user_subject, only: %i[update show]

  def update
    @user_subject = update_user_subject.call(user_subject: user_subject, **user_subject_params)
  end

  private

  def user_subject
    @user_subject ||= UserSubject.find(params[:id])
  end

  def user_subject_params
    symbolize params.require(:user_subject).permit(
      :user_id,
      :subject_id
    )
  end
end
