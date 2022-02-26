# frozen_string_literal: true
require 'leaderboard'

class LobbiesController < AuthenticatedController
  include LobbyDependencies['create_lobby', 'update_lobby']
  include AnonUserLobbyDependencies['create_anon_user_lobby']

  before_action :lobby, only: %i[show stats room_information leaderboard]
  before_action :highscore, only: %i[leaderboard]

  def index
    @lobbies = Lobby.all
  end

  def new
    @lobby = Lobby.new(**preload_params)
  end

  def create
    @lobby = create_lobby.call(create_lobby_params)
    redirect_to @lobby
  end

  def update
    @lobby = update_lobby.call(lobby: lobby, **update_lobby_params)
  end

  def leaderboard
    @leaderboard_list = lobby.lobby_questions.map(&:responses).flatten.group_by(&:anon_user).map do |anon_user, responses|
      [anon_user.username, responses.map(&:points).compact.sum]
    end.to_h.sort_by{|k, v| v}.reverse
  end
#
  private

  def lobby
    @lobby ||= Lobby.find(params[:id])
  end

  def create_lobby_params
    symbolize params.require(:lobby).permit(:lesson_id, :room_code, :session_date, :name, :state, :year_id)
  end

  def update_lobby_params
    symbolize params.require(:lobby).permit(:room_code, :session_date, :name, :state, :year_id)
  end

  def preload_params
    symbolize params.permit(:lesson_id)
  end

  def highscore
    @highscore ||= Leaderboard.new(
      'highscores',
      Leaderboard::DEFAULT_OPTIONS,
      {host: 'redis', port: 6379, db: 1}
    )
  end

  def add_members_to_highscore
    # highscore.remove_member('obedient aphid')
    # lobby.lobby_questions.map(&:responses).flatten.each do |response|
    #   highscore.rank_member(response.anon_user_id, response.points || 0)
    # end
  end
end
