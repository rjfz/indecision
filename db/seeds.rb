# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


subject = Subject.find_or_create_by(name: 'Computer Science')

    Course.create!(name: 'Internet Applications and Techniques', subject: subject)

admin = Role.create!(name: 'admin')
staff = Role.create!(name: 'staff')
student = Role.create!(name: 'student')
anon_user = Role.create!(name: 'anon_user' )

user = User.create!(email: 'fake@fakemail.com', password: 'password', role: student)
