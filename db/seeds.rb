3.times do
  User.create([{
    nickname:              Faker::Name.first_name,
    email:                 Faker::Internet.unique.email,
    password:              '123456',
    password_confirmation: '123456'
    }])
end

10.times do
  Post.create([{
    title:        Faker::Lorem.characters(10),
    body:         Faker::Lorem.paragraph(2),
    published_at: DateTime.now,
    author_id:    User.first.id
    }])
end

10.times do
  Post.create([{
    title:        Faker::Lorem.characters(10),
    body:         Faker::Lorem.paragraph(2),
    published_at: DateTime.now,
    author_id:    User.second.id
    }])
end

3.times do
  Comment.create([{
    body:      Faker::Lorem.paragraph(2),
    post_id:   Post.first.id,
    author_id: User.first.id
    }])
end

5.times do
  Comment.create([{
    body:      Faker::Lorem.paragraph(2),
    post_id:   Post.last.id,
    author_id: User.first.id
    }])
end

1.times do
  Comment.create([{
    body:      Faker::Lorem.paragraph(2),
    post_id:   Post.second.id,
    author_id: User.second.id
    }])
end

5.times do
  Comment.create([{
    body:      Faker::Lorem.paragraph(2),
    post_id:   Post.second.id,
    author_id: User.last.id
    }])
end
