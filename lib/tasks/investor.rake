namespace :investor do
  desc "Give some money to investors"
  task :deposit_money, [:amount] => :environment do |t, opts|
    amount = opts.to_hash.fetch(:amount, 1000)
    Investor.find_each do |investor|
      investor.add_funds((investor.get_points*1000) * amount)
      investor.save!
    end
  end

  task :update => :environment do
    Investor.find_each do |investor|
      updates = TeamUpdate.where.not(id: investor.team_update_ids).find(investor.teams.collect(&:team_update_ids).flatten.uniq)
      update_body = ""
      updates.each do |update|
      	update_body.concat("<br><h1><a href='http://game.startupbus.com/teams/#{update.team_id}'>#{update.team.name}</a></h1><br><img src='#{update.team.photo_url}' /><br><h2>#{update.subject}</h2><p><strong>New Score: #{update.team.total_points}</strong><br>#{update.body}</p>")
      	iu = InvestorTeamUpdate.new
      	iu.team_update = update
      	iu.investor = investor
      	iu.save
      end
      subject = "Investment Update: Your StartupBus Teams"
      UpdateSender.send_update_email(subject, update_body, investor).deliver
    end
  end
end
