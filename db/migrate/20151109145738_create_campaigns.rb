class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.decimal :media_budget
      t.decimal :media_spend
      t.decimal :impressions
      t.integer :clicks
      t.decimal :ctr
      t.integer :conversions
      t.decimal :e_cpm
      t.decimal :e_cpc
      t.decimal :e_cpa
      t.decimal :spent

      t.timestamps null: false
    end
  end
end
