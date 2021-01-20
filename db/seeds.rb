# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/symptomsample.csv') do |row|
    Symptom.create!(display: "なし", disporder: 1)
    Symptom.create!(display: "頭痛", disporder: 2)
    Symptom.create!(display: "発熱", disporder: 3)
    Symptom.create!(display: "腹痛", disporder: 4)
end
