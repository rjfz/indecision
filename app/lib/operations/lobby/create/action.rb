# frozen_string_literal: true

module Operations
  module Lobby
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(lobby).tap do |lobby|
            CreateLobbyQuestions.new(lobby).call
          end
        end

        private

        attr_reader :form

        def lobby
          @lobby ||= ::Lobby.new(attributes: attributes)
        end

        def attributes
          form.attributes.tap do |attrs|
            attrs[:room_code] = room_code
          end
        end

        def room_code
          new_code = generate_code
          new_code = generate_code while ::Lobby.where(room_code: new_code).any?
          new_code
        end

        def generate_code
          characters = [(0..9), ('A'..'Z')].map(&:to_a).flatten
          6.times.map { characters[rand(characters.length)] }.join
        end
      end
    end
  end
end
