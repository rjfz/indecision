# frozen_string_literal: true

module Operations
  module Subject
    module Destroy
      class Action
        def initialize(subject)
          @subject = subject
        end

        def call
          Command.destroy(subject).tap() do |subject|
            Operations::Subject::Update::EntryPoint.call(subject)
        end
      end

        private

        attr_reader :subject
      end
    end
  end
end
