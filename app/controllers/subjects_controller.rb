# frozen_string_literal: true

class SubjectsController < AuthenticatedController
  include SubjectDependencies['create_subject']

  def index; end

  def new
    @subject = Subject.new
  end

  def create
    @subject = create_subject.call(subject_params)
    redirect_to courses_path
  end

  private

  def subject_params
    symbolize params.require(:subject).permit(
      :name
    )
  end
end
