class SummonerController < ApplicationController
  def search
    redirect_to summoner_show_path(region: params.require(:region), username: params.require(:username))
  end

  def show
    @username = params.require(:username)
  end
end
