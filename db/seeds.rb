require 'csv'
p 'hi'
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'breweries_us.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Brewery.new
#   t.name = row['name']
#   t.category = row['category']
#   t.address = row['address']
#   t.website = row['website']
#   t.state = row['state']  
#   t.save
#   puts "#{t.name}, #{t.address} saved"
# end

# puts "There are now #{Brewery.count} rows in the transactions table"


# breweries = Brewery.all
# breweries.each do |brewery|
#   address = "#{brewery.address}, #{brewery.state}"
#   results = Geocoder.search(address)
#   no_results = 0
#   if results == []
#     no_results += 1
#   else
#     lat = results.first.coordinates[0]
#     lng = results.first.coordinates[1]
#     brewery.update(lat: lat, lng: lng)
#   end
#   # binding.pry
# end


# p "no results #{no_results}"


breweries = Brewery.where.not(lat: nil).where(state: 'new-york').limit(10)

address = "65 Niagara Square, Buffalo, NY 14202"
results = Geocoder.search(address)
# lat = results.first.coordinates[0]
# lng = results.first.coordinates[1]


distances = []

breweries.each do |brewery|
  distances << Geocoder::Calculations.distance_between(results.first.coordinates, [brewery.lat,brewery.lng])
end


binding.pry