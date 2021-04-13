class ADdStuffToBreweries < ActiveRecord::Migration[6.1]
  def change
    add_column :breweries, :lat, :float
    add_column :breweries, :lng, :float
  end
end
