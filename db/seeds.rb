# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
CSV.foreach('db/sample.csv') do |row|
    User.create(
        :account => row[0],
        :password => row[1],
        :grade => row[2],
        :room => row[3],
        :number => row[4],
        :name => row[5],
        :graduate => row[6],
        :teacher => row[7]
    )
end
