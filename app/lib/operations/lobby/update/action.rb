# frozen_string_literal: true

module Operations
  module Lobby
    module Update
      class Action
        def initialize(lobby, form)
          @form = form
          @lobby = lobby
        end

        def call
          lobby.assign_attributes(hold_params.compact)
          Command.save(lobby)
        end

        private

        attr_reader :form, :lobby

        def hold_params
          form.attributes.tap do |attrs|
            attrs.delete(:image) if attrs[:image].nil?
          end
        end
      end
    end
  end
end
