# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

palette = Palette.create(name: "Todd's Test Palette")

palette.colors.create(hex_value: '000000')
palette.colors.create(hex_value: '000000')
palette.colors.create(hex_value: '000000')
palette.colors.create(hex_value: '000000')
palette.colors.create(hex_value: '000000')
