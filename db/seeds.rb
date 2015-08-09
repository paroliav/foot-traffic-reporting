# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = Location.create([{ name: 'la-louvre'}, { name: 'MONA'}, {name: 'Museum of contemporary art'}, {name: 'The British Museum'}])

20.times do
  (1..31).each do |date|
    Visit.create(
        [
              {
                  location: locations[rand(0..3)],
                  start_time: Visit.start_date(date),
                  end_time: Visit.end_time,
                  signal: rand(-100..-1)
              }
        ]
    )
    rand(0..10).times do
      Visit.create(
          [
              {
                  location: locations[rand(0..3)],
                  start_time: Visit.seeded_start_time,
                  end_time: Visit.end_time,
                  signal: rand(-100..-1)
              }
          ]
      )
    end

  end
end

