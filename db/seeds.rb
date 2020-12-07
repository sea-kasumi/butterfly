# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
CSV.foreach('db/hour.csv') do |row|
    Hour.create(
        :display => row[0],
        :start_time => row[1],
        :end_time => row[2],
    )
end
