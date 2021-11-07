# frozen_string_literal: true

class ResponseContainer
  extend Dry::Container::Mixin

  register :create_response, Operations::Response::Create::EntryPoint
end

ResponseDependencies = Dry::AutoInject ResponseContainer
