class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :report, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
