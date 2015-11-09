class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :campaign
      t.timestamps null: false
    end
    add_index :reports, :campaign_id
  end
end
