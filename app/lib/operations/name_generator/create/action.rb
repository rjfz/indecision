# frozen_string_literal: true

module Operations
  module NameGenerator
    module Create
      class Action
        def call
          "#{usernames.adjectives.sample} #{usernames.nouns.sample}"
        end

        private

        def usernames
          @usernames ||= Settings.usernames
        end
      end
    end
  end
end
