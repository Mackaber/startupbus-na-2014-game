class Team < ActiveRecord::Base
  has_many :buspreneurs, as: :attachable
  has_many :investments
  has_and_belongs_to_many :milestones

  belongs_to :bus

  validates :name, :website, :twitter_handle, :github_url, :facebook_url,
            :uniqueness => true

  validates :description, presence: true

  delegate :name, to: :bus, prefix: true, allow_nil: false
  has_many :buspreneurs, as: :attachable
  has_many :investments
  has_many :milestones

  def buspreneur_names
    buspreneurs.pluck(:email).to_sentence
  end

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
