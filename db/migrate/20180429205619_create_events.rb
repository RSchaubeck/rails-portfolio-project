class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.strftime :start
      t.strftime :end
      t.integer :location_id

      t.timestamps
    end
  end
end
