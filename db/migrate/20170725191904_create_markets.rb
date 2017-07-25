class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.string :name
      t.decimal :value
      t.decimal :variation

      t.timestamps
    end
  end
end
