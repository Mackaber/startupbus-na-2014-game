['northeast', 'westcoast', 'midwest'].each do |region|
  Bus.find_or_create_by(:name => region)
end

['whatsapp', 'twitter', 'facebook', 'github'].each do |startup_name|
  bus = Bus.find_by(name: "northeast")

  team = Team.find_or_create_by(:name => startup_name, :website => "#{startup_name}.com",
              :twitter_handle => "@#{startup_name}", :facebook_url => "www.facebook.com/#{startup_name}",
              :github_url => "www.github.com/#{startup_name}", :description => "#{startup_name} is worth 20 billion dollars")

  bus.teams << team
end

%w(
  blane
  dan
  eric
  nicole
  juan
).each do |username|
  Buspreneur.find_or_create_by(email: "#{username}@gmail.com", username: username)
end

%w(
  pinzler
  alice
  nate
).each do |username|
  conductor = Conductor.find_or_create_by(email: "#{username}@gmail.com", username: username)
  Bus.find_by(name: "northeast").conductors << conductor
end

%w(
  joe
  steve
  fred
  wilson
  spaldin
).each do |username|
  Investor.find_or_create_by(email: "#{username}@gmail.com", username: username)
end

{
  'whatsapp' => %w(blane dan),
  'twitter' => %w(eric nicole),
  'facebook' => %w(juan)
}.each do |team_name, usernames|
  team = Team.find_by(name: team_name)

  usernames.each do |username|
    buspreneur = Buspreneur.find_by(username: username)
    team.buspreneurs << buspreneur
  end
end

%w(
  joe
  steve
  fred
  wilson
  spaldin
).each do |investor_name|
    investor = Investor.find_by(email: "#{investor_name}@gmail.com")
    Investment.find_or_create_by(investor_id: investor.id, team_id: Team.last.id, amount: 100)
    Investment.find_or_create_by(investor_id: investor.id, team_id: Team.first.id, amount: 82)
end


