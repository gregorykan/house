# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create({email: 'test@test.com', password: 'password'})
User.create({email: 'test2@test.com', password: 'password'})

Blog.create(title: 'blah', text: 'blah', user_id: 1)
Blog.create(title: 'blah', text: 'blah', user_id: 2)

Recipe.create(title: 'blah', text: 'blah', user_id: 1)
Recipe.create(title: 'blah', text: 'blah', user_id: 2)

Review.create(title: 'blah', text: 'blah', user_id: 1)
Review.create(title: 'blah', text: 'blah', user_id: 2)

Activity.create(user_id: 1, action: 'create', trackable_type: 'blog', trackable_id: 1)
Activity.create(user_id: 1, action: 'create', trackable_type: 'recipe', trackable_id: 1)
Activity.create(user_id: 1, action: 'create', trackable_type: 'review', trackable_id: 1)

Activity.create(user_id: 2, action: 'create', trackable_type: 'blog', trackable_id: 2)
Activity.create(user_id: 2, action: 'create', trackable_type: 'recipe', trackable_id: 2)
Activity.create(user_id: 2, action: 'create', trackable_type: 'review', trackable_id: 2)