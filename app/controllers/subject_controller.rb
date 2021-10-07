# frozen_string_literal: true

class SubjectController < ApplicationController
  before_action :require_signed_in

  def subject; end
end
