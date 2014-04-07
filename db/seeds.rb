# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


['Website Form', 'Phone Call', 'Email', 'Open House', 'Admission Request', 'Visiting Week', 'Family Interview'].each do |name|
  PointOfContactType.create(name: name)
end

['None', 'Email', 'Print'].each do |name|
  NewsletterOption.create(name: name)
end



