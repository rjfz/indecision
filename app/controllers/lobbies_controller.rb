# frozen_string_literal: true

class LobbiesController < AuthenticatedController
  include LobbyDependencies['create_lobby', 'update_lobby']

  before_action :lobby, only: %i[show]

  def index
    @lobbies = Lobby.all
  end

  def new
    @lobby = Lobby.new(lesson_id: params[:lesson_id])
  end

  def create
    @lobby = create_lobby.call(lobby_params)
    redirect_to @lobby
  end

  def update
    @lobby = update_lobby.call(lobby: lobby, **lobby_params)
  end


  private

  def lobby
    @lobby ||= Lobby.find(params[:id])
  end

  def lobby_params
    symbolize params.require(:lobby).permit(
      :lesson_id,
      :room_code,
      :session_date,
      :name,
      :state
    )
  end
end
