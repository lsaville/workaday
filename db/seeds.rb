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
        avatar_url: Faker::Avatar.image,
        name: Faker::Name.last_name,
        email: Faker::Internet.email,
        oauth_token: Faker::Number.number(7),
        oauth_expires_at: Faker::Time.forward(30, :morning)
      )
      puts "Created user: #{i}, name: #{user.name}"
    end
  end

  def locations
    [
      [40.748817, -73.985428],
      [48.8584, 2.2945],
      [35.6895, 139.6917],
      [25.2048, 55.2708],
      [19.4326, 99.1332],
      [34.6037, 58.3816],
      [4.7110, 74.0721],
      [23.5505, 46.6333],
      [22.3964, 114.1095],
      [8.9806, 38.7578]
    ]
  end

  def create_projects
    10.times do |i|
      project = Project.create!(
        lat: locations[i].first,
        lng: locations[i].last,
        title: Faker::Book.title,
        details: Faker::Hipster.paragraph,
      )
      puts "Created project: #{i}, title: #{project.title}"
    end
  end
end

Seeds.start
