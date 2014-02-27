namespace :investor do
  desc "Give some money to investors"
  task :deposit_money, [:amount] => :environment do |t, opts|
    amount = opts.to_hash.fetch(:amount, 1000)

    Investor.find_each do |investor|
      investor.add_funds(amount)
      investor.save!
    end
  end
end
