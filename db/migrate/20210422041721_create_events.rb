class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.decimal :price, precision: 8, scale: 2 ,default: 0.0
      t.text    :description
      t.integer  :capacity, default: 1
      t.datetime    :starts_at
      t.timestamps
    end
  end
end
