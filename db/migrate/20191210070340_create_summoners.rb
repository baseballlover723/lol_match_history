class CreateSummoners < ActiveRecord::Migration[6.0]
  def change
    create_table :summoners do |t|
      t.string :username
      t.string :puuid
      t.string :summoner_id
      t.string :account_id
      t.bigint :revisionDate
      t.string :region

      t.timestamps
    end
  end
end
