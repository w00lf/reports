class CreateCampaignEntries < ActiveRecord::Migration
  def change
    create_table :campaign_entries do |t|
      t.decimal :media_spend
      t.decimal :impressions
      t.integer :clicks
      t.decimal :ctr
      t.integer :conversions
      t.decimal :e_cpm
      t.decimal :e_cpc
      t.decimal :e_cpa
      t.decimal :spent
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
