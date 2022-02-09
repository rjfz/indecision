# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    user.role = Role.find_by(name: 'anon_user') if user.role.nil?

    user.role.role_permissions.each do |role_permission|
      can action(role_permission.action), resource(role_permission.resource)
    end
  end

  private

  def action(permission)
    permission.to_sym
  end

  def resource(permission)
    permission.to_sym
  end
end

