class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.string :how_heard
      t.integer :user_id
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
