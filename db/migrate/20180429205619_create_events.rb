class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.integer :location_id

      t.timestamps
    end
  end
end
