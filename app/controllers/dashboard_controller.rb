# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :require_signed_in

  def dashboard; end
end
