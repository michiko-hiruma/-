# coding: utf-8

User.create!( name: "管理者",
              admin: true,
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")
99.times do |n|
    name = Faker::Name.name
    User.create!( name: name,
              email: "sample#{n+1}@email.com",
              password: "password",
              password_confirmation: "password")
end

user = User.find(1)              
50.times do |n|              
    Task.create!( name: "タスク#{n+1}",
                  description: "タスク詳細#{n+1}",
                  user_id: user.id)
end              
user = User.find(2)              
50.times do |n|              
    Task.create!( name: "タスク#{n+1}",
                  description: "タスク詳細#{n+1}",
                  user_id: user.id)
end       