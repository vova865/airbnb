class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bed_room
      t.integer :bath_room
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.string :is_air
      t.string :boolean
      t.boolean :is_heating
      t.boolean :is_internet
      t.integer :price
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
