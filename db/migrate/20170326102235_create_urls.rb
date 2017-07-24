class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :isin
      t.string :url1
      t.string :url2
      t.string :url3
      t.string :url4
      t.string :url5
      t.string :url6
      t.string :url7
      t.string :url8
      t.string :url9
      t.string :url10

      t.timestamps
    end
  end
end
