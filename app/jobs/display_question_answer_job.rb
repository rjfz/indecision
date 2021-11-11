class DisplayQuestionAnswerJob < ApplicationJob

  queue_as :default

  def perform(response)
    response.broadcast_replace_to(response.lobby_question.lobby_id)
  end

end
