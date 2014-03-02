namespace :investor do
  desc "Give some money to investors"
  task :deposit_money, [:amount] => :environment do |t, opts|
    amount = opts.to_hash.fetch(:amount, 1000)
    Investor.find_each do |investor|
      investor.add_funds((investor.get_points/1000) * amount)
      investor.save!
    end
  end

  task :update => :environment do
    Investor.find_each do |investor|
      updates = TeamUpdate.includes(investor.teams.collect(&:team_update_ids).flatten).where.not(id: investor.team_update_ids)
      update_body = ""
      updates.each do |update|
      	update_body.concat("<br><img src='#{update.team.photo_url}' /><br><h1>#{update.subject}</h1><p>#{update.body}</p>")
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
