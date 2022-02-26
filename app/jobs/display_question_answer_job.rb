# frozen_string_literal: true

class DisplayQuestionAnswerJob < ApplicationJob
  include ActionView::RecordIdentifier

  queue_as :default

  def perform(response)
    response.broadcast_replace_to(dom_id(response))
  end
end
