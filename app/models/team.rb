class Team < ActiveRecord::Base

  delegate :name, to: :bus, prefix: true, allow_nil: false

  validates :name, :website, :twitter_handle, :github_url, :facebook_url,
            :uniqueness => true
  validates :description, :presence => true

  has_many :buspreneurs, as: :attachable

  has_many :investments

  belongs_to :bus

  def self.sorted_by_score
    Team.all.sort_by {|team| team.ranking}
  end

  #def pending_approvals
    #User.where(:team_id => self.id, :team_status => "pending")
  #end

  def funding
    @funding ||= investments.pluck(:amount).reduce(:+)
  end

  def score
    0
  end
end
