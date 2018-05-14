# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

if Rails.env.development?
  @universities = Array.new(10){University.create({name: Faker::University.unique.name })}
  @tags = Array.new(40){Tag.create({name: Faker::Name.unique.first_name   })}

  @chapters = Array.new(100){
    Chapter.create({name: Faker::University.greek_organization, university: @universities.sample })
  }



end