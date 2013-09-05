class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :url
    	t.string :address
    	t.boolean :washer_dryer
    	t.integer :monthly_rent
    	t.datetime :movein_date
    	t.integer :contact_id

      t.timestamps
    end
  end
end
