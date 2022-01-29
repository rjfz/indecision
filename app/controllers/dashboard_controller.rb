# frozen_string_literal: true

class DashboardController < AuthenticatedController
  before_action :require_signed_in

  def dashboard; end
end
