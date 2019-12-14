require 'riot_client'

class SummonerController < ApplicationController
  def search
    redirect_to summoner_show_path(region: params.require(:region), username: params.require(:username))
  end

  def show
    @username = params.require(:username)
    @summoner = RiotClient.get_summoner(region: RiotClient.get_region(:na), username: @username)
  end
end
