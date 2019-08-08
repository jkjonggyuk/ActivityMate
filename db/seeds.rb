# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Data for Location drop down bar on search page
location_list = [
  [ "Austin, Texas", "Texas", "1" ],
  [ "Boston, Massachusetts", "Massachusetts", "2" ],
  [ "Calgary, Alberta", "Alberta", "3" ],
  [ "Chicago, Illinois", "Illinois", "4" ], 
  [ "Dallas, Texas", "Texas", "5" ],
  [ "Denver, Colorado", "Colorado", "6" ],
  [ "Edmonton, Alberta", "Alberta", "7" ],
  [ "Halifax, Nova Scotia", "Nova Scotia", "8" ],
  [ "Hamilton, Ontario", "Ontario", "9" ],
  [ "Honolulu, Hawaii", "Hawaii", "10" ],
  [ "Houston, Texas", "Texas", "11" ], 
  [ "Los Angeles, California", "California", "12" ], 
  [ "Miami, Florida", "Florida", "13" ],
  [ "Mississauga, Ontario", "Ontario", "14" ],
  [ "Montreal, Quebec", "Quebec", "15" ],
  [ "New York City, New York", "New York", "16" ], 
  [ "Ottawa, Ontario", "Ontario", "17" ],
  [ "Philadelphia, Pennsylvania", "Pennsylvania", "18" ], 
  [ "Phoenix, Arizona", "Arizona", "19" ], 
  [ "Portland, Oregon", "Oregon", "20" ],
  [ "Quebec City, Quebec", "Quebec", "21" ],
  [ "San Antonio, Texas", "Texas", "22" ], 
  [ "San Diego, California", "California", "23" ], 
  [ "San Francisco, California", "California", "24" ], 
  [ "San Jose, California", "California", "25" ], 
  [ "Seattle, Washington", "Washington", "26" ], 
  [ "Toronto, Ontario", "Ontario", "27" ],
  [ "Vancouver, British Columbia", "British Columbia", "28" ],
  [ "Victoria, British Columbia", "British Columbia", "29" ],
  [ "Winnipeg, Manitoba", "Manitoba", "30" ],
]

location_list.each do |city, state, country|
  Location.create( city: city, state: state, country: country )
end


