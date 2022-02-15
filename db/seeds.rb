# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
   email: 'admin@admin',
   password: 'zxcvbnm'
)


# 以下、都道府県市区町村.csvの呼び出し
require 'csv'
  file_path = 'lib/都道府県市区町村.csv'
  csv_data = CSV.read(file_path)
# 都道府県データ
 prefectures_list = csv_data.map { |row| row[1] }.uniq
#  市区町村データ
 cities_list = csv_data.map do |row|
   next if row[2] == nil
   row[1, 2]
   end.compact
 # 都道府県データ作成
 prefectures_list.each do |prefecture|
  Prefecture.create!(name: prefecture)
 end
# 市区町村データ作成
 cities_list.each do |prefecture, city|
  prefecture = Prefecture.find_by(name: prefecture)
  prefecture.cities.create(name: city)
 end