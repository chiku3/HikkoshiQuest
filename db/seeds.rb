# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# タスク
require 'csv'
CSV.foreach('lib/タスク一覧.csv', headers: true) do |row|
  Task.create(
    name: row['name'],
    title: row['title'],
    body_a: row['body_a'],
    body_b: row['body_b']
  )
end
