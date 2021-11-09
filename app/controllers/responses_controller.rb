# frozen_string_literal: true

class ResponsesController < AuthenticatedController
  include ResponseDependencies['create_response']

  def new
    @response = Response.new(lobby_question_id: params[:lobby_question_id])
  end

  def create
    @response = create_response.call(response_params)
  end



  private

   def response_params
    symbolize params.require(:lobby).permit(
      :lesson_id,
      :question_id,
      :answer_id
    )
   end
end
