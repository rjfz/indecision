# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

compsci = Subject.find_or_create_by(name: 'Computer Science')
history = Subject.find_or_create_by(name: 'History')
biology = Subject.find_or_create_by(name: 'Biology')
maths = Subject.find_or_create_by(name: 'Maths')
chem = Subject.find_or_create_by(name: 'Chemistry')
art = Subject.find_or_create_by(name: 'Art')
geography = Subject.find_or_create_by(name: 'Geography')

course = Course.create!(name: 'Internet Applications and Techniques', subject: compsci)

year = Year.create!(academic_year: '2022-2023')
lesson = Lesson.create!(name: 'this is a lobby', number: '1', course: course)

admin = Role.create!(name: 'admin')
staff = Role.create!(name: 'staff')
student = Role.create!(name: 'student')
anon_user = Role.create!(name: 'anon_user')

user = User.create!(email: 'fake@fakemail.com', password: 'password', role: student)
user2 = User.create!(email: 'fake2@fakemail.com', password: 'password', role: staff)
user3 = User.create!(email: 'fake3@fakemail.com', password: 'password', role: admin)

UserSubject.create!(user: user2, subject: compsci)
UserSubject.create!(user: user2, subject: history)


# answer permissions
RolePermission.create!(role: admin, resource: 'answer', action: 'view')
RolePermission.create!(role: admin, resource: 'answer', action: 'create')
RolePermission.create!(role: admin, resource: 'answer', action: 'update')
RolePermission.create!(role: admin, resource: 'answer', action: 'delete')

RolePermission.create!(role: staff, resource: 'answer', action: 'view')
RolePermission.create!(role: staff, resource: 'answer', action: 'create')
RolePermission.create!(role: staff, resource: 'answer', action: 'update')
RolePermission.create!(role: staff, resource: 'answer', action: 'delete')

#course permissions

RolePermission.create!(role: admin, resource: 'course', action: 'view')
RolePermission.create!(role: admin, resource: 'course', action: 'create')
RolePermission.create!(role: admin, resource: 'course', action: 'update')
RolePermission.create!(role: admin, resource: 'course', action: 'delete')

RolePermission.create!(role: staff, resource: 'course', action: 'view')
RolePermission.create!(role: staff, resource: 'course', action: 'create')


#dashboard permissions

RolePermission.create!(role: admin, resource: 'dashboard', action: 'view')
RolePermission.create!(role: admin, resource: 'dashboard', action: 'create')
RolePermission.create!(role: admin, resource: 'dashboard', action: 'update')
RolePermission.create!(role: admin, resource: 'dashboard', action: 'delete')

RolePermission.create!(role: staff, resource: 'dashboard', action: 'view')
RolePermission.create!(role: staff, resource: 'dashboard', action: 'create')
RolePermission.create!(role: staff, resource: 'dashboard', action: 'update')
RolePermission.create!(role: staff, resource: 'dashboard', action: 'delete')

#lesson permissions

RolePermission.create!(role: admin, resource: 'lesson', action: 'view')
RolePermission.create!(role: admin, resource: 'lesson', action: 'create')
RolePermission.create!(role: admin, resource: 'lesson', action: 'update')
RolePermission.create!(role: admin, resource: 'lesson', action: 'delete')

RolePermission.create!(role: staff, resource: 'lesson', action: 'view')
RolePermission.create!(role: staff, resource: 'lesson', action: 'create')
RolePermission.create!(role: staff, resource: 'lesson', action: 'update')
RolePermission.create!(role: staff, resource: 'lesson', action: 'delete')

#lobbies permissions

RolePermission.create!(role: admin, resource: 'lobby', action: 'view')
RolePermission.create!(role: admin, resource: 'lobby', action: 'create')
RolePermission.create!(role: admin, resource: 'lobby', action: 'update')
RolePermission.create!(role: admin, resource: 'lobby', action: 'delete')

RolePermission.create!(role: staff, resource: 'lobby', action: 'view')
RolePermission.create!(role: staff, resource: 'lobby', action: 'create')
RolePermission.create!(role: staff, resource: 'lobby', action: 'update')
RolePermission.create!(role: staff, resource: 'lobby', action: 'delete')

RolePermission.create!(role: student, resource: 'lobby', action: 'view')
RolePermission.create!(role: anon_user, resource: 'lobby', action: 'view')


#question permissions

RolePermission.create!(role: admin, resource: 'question', action: 'view')
RolePermission.create!(role: admin, resource: 'question', action: 'create')
RolePermission.create!(role: admin, resource: 'question', action: 'update')
RolePermission.create!(role: admin, resource: 'question', action: 'delete')

RolePermission.create!(role: staff, resource: 'question', action: 'view')
RolePermission.create!(role: staff, resource: 'question', action: 'create')
RolePermission.create!(role: staff, resource: 'question', action: 'update')
RolePermission.create!(role: staff, resource: 'question', action: 'delete')

#response permissions

RolePermission.create!(role: admin, resource: 'response', action: 'view')
RolePermission.create!(role: admin, resource: 'response', action: 'update')
RolePermission.create!(role: admin, resource: 'response', action: 'delete')

RolePermission.create!(role: staff, resource: 'response', action: 'view')
RolePermission.create!(role: staff, resource: 'response', action: 'delete')

RolePermission.create!(role: student, resource: 'response', action: 'view')
RolePermission.create!(role: student, resource: 'response', action: 'create')
RolePermission.create!(role: anon_user, resource: 'response', action: 'view')
RolePermission.create!(role: anon_user, resource: 'response', action: 'create')



#subject permissions

RolePermission.create!(role: admin, resource: 'subject', action: 'view')
RolePermission.create!(role: admin, resource: 'subject', action: 'create')
RolePermission.create!(role: admin, resource: 'subject', action: 'update')
RolePermission.create!(role: admin, resource: 'subject', action: 'delete')

RolePermission.create!(role: staff, resource: 'subject', action: 'view')

#years permissions

RolePermission.create!(role: admin, resource: 'year', action: 'view')
RolePermission.create!(role: admin, resource: 'year', action: 'create')
RolePermission.create!(role: admin, resource: 'year', action: 'update')
RolePermission.create!(role: admin, resource: 'year', action: 'delete')

#lobbyquestion permissions

RolePermission.create!(role: admin, resource: 'lobbyquestion', action: 'view')
RolePermission.create!(role: admin, resource: 'lobbyquestion', action: 'create')
RolePermission.create!(role: admin, resource: 'lobbyquestion', action: 'update')
RolePermission.create!(role: admin, resource: 'lobbyquestion', action: 'delete')

RolePermission.create!(role: staff, resource: 'lobbyquestion', action: 'view')
RolePermission.create!(role: staff, resource: 'lobbyquestion', action: 'create')
RolePermission.create!(role: staff, resource: 'lobbyquestion', action: 'update')
RolePermission.create!(role: staff, resource: 'lobbyquestion', action: 'delete')

RolePermission.create!(role: student, resource: 'lobbyquestion', action: 'view')
RolePermission.create!(role: anon_user, resource: 'lobbyquestion', action: 'view')
