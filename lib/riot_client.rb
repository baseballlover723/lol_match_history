class RiotClient
  API_KEY = ENV['RIOT_API_KEY']
  REGION_TRANSLATOR = {br: 'br1', eune: 'eun1', euw: 'euw1', jp: 'jp1', kr: 'kr', lan: 'la1', las: 'la2',
                       na: 'na1', oce: 'oc1', ru: 'ru', tr: 'tr1'}.with_indifferent_access

  URL_TEMPLATE = 'https://%{region}.api.riotgames.com/'
  SUMMONER_PATH = 'lol/summoner/v4/summoners/by-name/%{username}'

  def self.key
    API_KEY
  end

  def self.get_region(human_region)
    REGION_TRANSLATOR[human_region]
  end

  def self.get_summoner(region:, username:)
    url = (URL_TEMPLATE % {region: region}) + SUMMONER_PATH % {username: username}
    response = HTTParty.get(url, headers: {'X-Riot-Token': RiotClient.key})
    summoner = Summoner.find_or_create_by(puuid: response['puuid'])
    summoner.update({username: response['name'],
              summoner_id: response['id'],
              account_id: response['accountId'],
              revision_date: Time.at(response['revisionDate'].to_i / 1_000),
              region: region
             })
    summoner
  end
end
