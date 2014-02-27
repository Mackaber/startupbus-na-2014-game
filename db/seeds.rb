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

Milestone.create([{
    name: "Landing Page", 
    description: "Create your team landing page and collect preliminary users", 
    max_points: 200, 
    target_completion_date: Time.new(2014, 3, 2), 
    validation_instructions: "Landing Page must be live. Must accept email addresses. Must be approved by conductor.", 
    public_instructions: "Team must create a Landing Page."},

  {
    name: "Form Entity", 
    description: "Form an entity appropriate to your company's needs", 
    max_points: 200, 
    target_completion_date: Time.new(2014, 3, 3), 
    validation_instructions: "Documents must be receieved from Delaware. Must be approved by conductor.", 
    public_instructions: "Form Entity"},

  {
    name: "Create Founders Agreement", 
    description: "Draft and sign your company's founders agreement, deciding on equity breakout.", 
    max_points: 200, 
    target_completion_date: Time.new(2014, 3, 3), 
    validation_instructions: "Founders agreement must be signed. Equity split must be decided. Must be approved by conductor.", 
    public_instructions: "Team must sign a founders agreement."},

  {
    name: "Launch MVP", 
    description: "Launch your minimum viable product.", 
    max_points: 200, 
    target_completion_date: Time.new(2014, 3, 4), 
    validation_instructions: "Product must be live on the internets. Must be approved by conductor.", 
    public_instructions: "Launch minimum viable product."},

  {
    name: "Create Press Release", 
    description: "Draft and sell your press release to the media.", 
    max_points: 200, 
    target_completion_date: Time.new(2014, 3, 5), 
    validation_instructions: "Team must create a press release and distribute it to the media. Must be approved by conductor.", 
    public_instructions: "Team must put out a press release."}]
  )

MilestoneTeam.create([{
    milestone_id: 1, team_id: 1, awarded_points: 100},
   {milestone_id: 2, team_id: 1, awarded_points: 82},   
   {milestone_id: 3, team_id: 1, awarded_points: 25},
   {milestone_id: 2, team_id: 2, awarded_points: 125},
   {milestone_id: 3, team_id: 2, awarded_points: 100},
   {milestone_id: 1, team_id: 3, awarded_points: 100},
   {milestone_id: 2, team_id: 3, awarded_points: 100},
   {milestone_id: 3, team_id: 3, awarded_points: 100},
   {milestone_id: 4, team_id: 3, awarded_points: 100},
   {milestone_id: 1, team_id: 4, awarded_points: 99}
  ])


