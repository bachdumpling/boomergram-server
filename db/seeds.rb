require 'faker'

User.destroy_all
# Relationship.destroy_all
# Like.destroy_all
# Comment.destroy_all
# Post.destroy_all

puts '🌱🍀Seeding Users...'
bach = User.create!(username: 'bachdumpling', password: '123', bio: 'Hi! This is a dummy profile.', avatar_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Sea_Otter_%28Enhydra_lutris%29_%2825169790524%29_crop.jpg/800px-Sea_Otter_%28Enhydra_lutris%29_%2825169790524%29_crop.jpg')
bach1 = User.create!(username: 'egirl', password: '123', bio: 'Hi! This is a dummy profile.', avatar_url: 'https://images.unsplash.com/photo-1661413617925-a092881d490d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80')
bach2 = User.create!(username: 'eboy', password: '123', bio: 'Hi! This is a dummy profile.', avatar_url: 'https://images.unsplash.com/photo-1661433511340-9b93bb1d4d5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80')
bach3 = User.create!(username: 'depressedWithAnIcedCoffee', password: '123', bio: 'Hi! This is a dummy profile.', avatar_url: 'https://images.unsplash.com/photo-1659535998184-15d6c9f5f873?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
bach4 = User.create!(username: 'why_are_you_not_following_me?', password: '123', bio: 'Hi! This is a dummy profile.', avatar_url: 'https://images.unsplash.com/photo-1661376178649-ee53c9ad1150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
puts 'Done seeding users'

puts '🌱🍀Seeding Relationship...'
Relationship.create(follower_id: bach.id, followee_id: bach1.id);
Relationship.create(follower_id: bach.id, followee_id: bach2.id);
Relationship.create(follower_id: bach.id, followee_id: bach3.id);

Relationship.create(follower_id: bach1.id, followee_id: bach.id);
Relationship.create(follower_id: bach2.id, followee_id: bach.id);
Relationship.create(follower_id: bach3.id, followee_id: bach.id);
Relationship.create(follower_id: bach4.id, followee_id: bach.id);
puts 'Done seeding relationship'

puts '🌱🍀Seeding Posts...'
post1 = Post.create!(user_id: bach2.id, img_url: "https://images.unsplash.com/photo-1660235075177-07a019c999ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80", caption: Faker::Quote.famous_last_words)
Like.create(user_id: bach.id, post_id: post1.id)
Like.create(user_id: bach1.id, post_id: post1.id)
Like.create(user_id: bach2.id, post_id: post1.id)
Like.create(user_id: bach1.id, post_id: post1.id)
Like.create(user_id: bach2.id, post_id: post1.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach.id,post_id: post1.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post1.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post1.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post1.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post1.id)

post2 = Post.create!(user_id: bach3.id, img_url: "https://images.unsplash.com/photo-1660235075177-07a019c999ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80", caption: Faker::Quote.famous_last_words)
Like.create(user_id: bach.id, post_id: post2.id)
Like.create(user_id: bach1.id, post_id: post2.id)
Like.create(user_id: bach2.id, post_id: post2.id)
Like.create(user_id: bach2.id, post_id: post2.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach.id,post_id: post2.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post2.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post2.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post2.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post2.id)

post3 = Post.create!(user_id: bach3.id, img_url: "https://images.unsplash.com/photo-1657299143548-658603d76b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60", caption: Faker::Quote.famous_last_words)
Like.create(user_id: bach.id, post_id: post3.id)
Like.create(user_id: bach1.id, post_id: post3.id)
Like.create(user_id: bach2.id, post_id: post3.id)
Like.create(user_id: bach1.id, post_id: post3.id)
Like.create(user_id: bach2.id, post_id: post3.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach3.id,post_id: post3.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post3.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post3.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach3.id,post_id: post3.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post3.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post3.id)

post4 = Post.create!(user_id: bach1.id, img_url: "https://images.unsplash.com/photo-1660213373329-8ad1e2e0f82d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80", caption: Faker::Quote.famous_last_words)
Like.create(user_id: bach.id, post_id: post4.id)
Like.create(user_id: bach1.id, post_id: post4.id)
Like.create(user_id: bach2.id, post_id: post4.id)
Like.create(user_id: bach.id, post_id: post4.id)
Like.create(user_id: bach1.id, post_id: post4.id)
Like.create(user_id: bach2.id, post_id: post4.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach.id,post_id: post4.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post4.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post4.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post4.id)

post5 = Post.create!(user_id: bach2.id, img_url: "https://images.unsplash.com/photo-1660213373329-8ad1e2e0f82d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80", caption: Faker::Quote.famous_last_words)
Like.create(user_id: bach.id, post_id: post5.id)
Like.create(user_id: bach1.id, post_id: post5.id)
Like.create(user_id: bach2.id, post_id: post5.id)
Like.create(user_id: bach1.id, post_id: post5.id)
Like.create(user_id: bach2.id, post_id: post5.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach.id,post_id: post5.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post5.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post5.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post5.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post5.id)

post6 = Post.create!(user_id: bach4.id, img_url: "https://images.unsplash.com/photo-1660213373329-8ad1e2e0f82d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80", caption: Faker::Quote.famous_last_words)
Like.create(user_id: bach.id, post_id: post6.id)
Like.create(user_id: bach1.id, post_id: post6.id)
Like.create(user_id: bach2.id, post_id: post6.id)
Like.create(user_id: bach1.id, post_id: post6.id)
Like.create(user_id: bach2.id, post_id: post6.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach.id,post_id: post6.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post6.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post6.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach.id,post_id: post6.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach1.id,post_id: post6.id)
Comment.create(content: Faker::Quote.famous_last_words, user_id: bach2.id,post_id: post6.id)
puts "Done seeding posts"