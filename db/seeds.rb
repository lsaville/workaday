class Seeds
  def self.start
    seeds = Seeds.new
    seeds.create_users
    seeds.create_projects
  end

  def create_users
    10.times do |i| 
      user = User.create!(
        provider: "google_oauth2",
        uid: Faker::Number.number(10),
        name: Faker::Name.last_name,
        email: Faker::Internet.email,
        oauth_token: Faker::Number.number(7),
        oauth_expires_at: Faker::Time.forward(30, :morning)
      )
      puts "Created user: #{i}, name: #{user.name}"
    end
  end

  def create_projects
    10.times do |i|
      project = Project.create!(
        lat: Faker::Address.latitude,
        lng: Faker::Address.longitude,
        title: Faker::Book.title,
        details: Faker::Hipster.paragraph,
      )
      puts "Created project: #{i}, title: #{project.title}"
    end
  end
end

Seeds.start
