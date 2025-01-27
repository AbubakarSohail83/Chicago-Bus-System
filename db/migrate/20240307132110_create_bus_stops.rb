class CreateBusStops < ActiveRecord::Migration[7.1]
  def change
    create_table :bus_stops do |t|
      t.integer :stop_id
      t.string :on_street, default: ''
      t.string :cross_street, default: ''
      t.string :routes, array: true, default: []
      t.float :boardings
      t.float :alightings
      t.string :month_beginning, default: ''
      t.string :daytype, default: ''
      t.jsonb :location, default: {}
      t.timestamps
    end
    add_index :bus_stops, :routes, using: :gin
  end
end
