namespace :investor do
  desc "Give some money to investors"
  task :deposit_money, [:amount] => :environment do |t, opts|
    amount = opts.to_hash.fetch(:amount, 1000)

    Investor.find_each do |investor|
      investor.add_funds(amount)
      investor.save!
    end
  end

  task :update => :environment do
    Investor.find_each do |investor|
    	admins.map {|a| [a.name, a.orders.collect(&:operation)]}
      updates = TeamUpdate.includes(investor.teams.collect(&:team_update_ids).flatten).where.not(id: investor.team_update_ids)
      puts updates
    #  investor.add_funds(amount)
     # investor.save!
    end

  	# TeamUpdate.find_each do |team_update|
  	# 	Investor.where.not(id: team_update.investor_ids).find_each do |investor|
  	# 		iu = InvestorTeamUpdate.new
  	# 		iu.team_update = team_update
  	# 		iu.investor = investor
  	# 		iu.save
  	# 	end
  	# end

  end
end
