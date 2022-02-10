# frozen_string_literal: true

class UserContainer
  extend Dry::Container::Mixin

  register :update_user, Operations::User::Update::EntryPoint
end

UserDependencies = Dry::AutoInject UserContainer
