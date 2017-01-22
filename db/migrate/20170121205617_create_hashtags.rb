class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :name
      t.belongs_to :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
