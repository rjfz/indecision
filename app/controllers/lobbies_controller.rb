# frozen_string_literal: true

class LobbiesController < AuthenticatedController
  include LobbyDependencies['create_lobby']

  def index; end

  def new
    @lobby = Lobby.new(lesson_id: params[:lesson_id])
  end

  def create
    @lobby = create_lobby.call(lobby_params)
    redirect_to @lobby
  end

  private

  def lobby_params
    symbolize params.require(:lobby).permit(
      :lesson_id,
      :room_code,
      :session_date,
      :name
    )
  end
end
