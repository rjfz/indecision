# frozen_string_literal: true

class UserSubjectContainer
  extend Dry::Container::Mixin

  register :create_user_subject, Operations::UserSubject::Create::EntryPoint
  # register :destroy_user_subject, Operations::UserSubject::Destroy::EntryPoint
  register :update_user_subject, Operations::UserSubject::Update::EntryPoint
end

UserSubjectDependencies = Dry::AutoInject UserSubjectContainer
