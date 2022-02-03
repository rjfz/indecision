# frozen_string_literal: true

class YearsController < AuthenticatedController
  include YearDependencies['create_year']

  def index; end

  def new
    @year = Year.new
  end

  def create
    @year = create_year.call(year_params)
    redirect_to dashboard_path
  end

  private

  def year
    @year ||= Year.find(params[:id])
  end

  def year_params
    symbolize params.require(:year).permit(
      :academic_year
    )
  end
end
