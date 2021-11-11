# frozen_string_literal: true

class ResponsesController < AuthenticatedController
  include ResponseDependencies['create_response']

  before_action :set_response, only: %i[show]


  def new
    @response = Response.new(lobby_question_id: params[:lobby_question_id])
  end



  def create
    @response = create_response.call(response_params)
    timer = @response.lobby_question.started_at + @response.lobby_question.question.time_limit.seconds
    DisplayQuestionAnswerJob.set(wait_until: timer).perform_later(@response)
    redirect_to @response
  end



  private

  def set_response
    @response ||= Response.find(params[:id])
  end

   def response_params
    symbolize params.require(:response).permit(
      :lobby_question_id,
      :answer_id,
      :user_id
    )
   end
end


