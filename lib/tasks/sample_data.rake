namespace :db do
  desc "Llenar base de datos con ejemplo"
  task :populate => :environment do
    require 'faker'
    make_users
    make_actions
    make_user_actions
    make_user_relationships
    
  end

  def make_users
    User.create!(first_name: "Juan Carlos",
                 last_name: "Sanchez",
                 email: "jjuanchow@gmail.com",
                 password: "juancar1os",
                 password_confirmation: "juancar1os")
    99.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "ejemplo-#{n+1}@muevete.org"
      password = "password111"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password, 
                   password_confirmation: password)
    end
  end

  def make_actions
    Action.create!(name: "Accion Saludable 1", desc: "Esta es una accion saludable que puedes checar blablablab", points: 20, level: 1)
    30.times do |n|
      name = Faker::Lorem.sentence(1)
      desc = Faker::Lorem.sentence(20)
      points = n + 10
      level = 1
      if n >= 10 && n < 20
        level = 2
      elsif n >= 20
        level = 3
      else 
        level = 1
      end
      canj = true
      code = "AAAA-12345"
      if n > 20
        canj = false
      end 
      Action.create!(name: name,
                     desc: desc,
                     points: points,
                     level: level,
                     canjeable: canj,
                     code: code)
    end
  end

  def make_user_actions
    users = User.all
    user = users.first
    acciones = Action.all.sample(3)
    acciones.each { | accion | user.do_action!(accion)}
  end

  def make_user_relationships
    users = User.all
    user = User.first
    followed_users = users[2..50]
    followers      = users[3..40]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each { |follower| follower.follow!(user) }
  end


end