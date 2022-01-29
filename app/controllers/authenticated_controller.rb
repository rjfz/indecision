# frozen_string_literal: true

class AuthenticatedController < ApplicationController

  layout 'private'
  
  def signed_in?
    current_user != nil
  end

  def require_signed_in
    redirect_to '/' unless signed_in?
  end

  def symbolize(parameters)
    parameters.to_h.symbolize_keys
  end
end
