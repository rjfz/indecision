# frozen_string_literal: true

class PublicLobbiesController < ApplicationController
  include LobbyDependencies['create_lobby', 'update_lobby']
  include AnonUserLobbyDependencies['create_anon_user_lobby']

  before_action :lobby, only: %i[show]

  def room_code
    room_code = params[:search].upcase
    lobby = Lobby.find_by(room_code: room_code)

    if lobby
      create_anon_user_lobby.call(lobby_id: lobby.id, anon_user_id: anon_user.id)
      return redirect_to public_lobby_path(lobby)
    end

    flash[:error] = 'Room code not found'
    redirect_to homepage_path
  end

  # def leaderboard
  #   @leaderboard_list = lobby.lobby_questions.map(&:responses).flatten.group_by(&:anon_user).map do |anon_user, responses|
  #     [anon_user.username, responses.map(&:points).compact.sum]
  #   end.to_h
  # end

  private

  def lobby
    @lobby ||= Lobby.find(params[:id])
  end

end
