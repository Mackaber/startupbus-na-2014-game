class Team < ActiveRecord::Base
  include Enumerable

  has_many :buspreneurs, as: :attachable
  has_many :investments
  has_many :milestone_teams
  has_many :milestones, :through => :milestone_teams

  has_many :messages, :through => :team_messages

  accepts_nested_attributes_for :milestone_teams

  belongs_to :bus

  validates :name, :website, :twitter_handle, :github_url, :facebook_url,
            :uniqueness => true

  validates :description, presence: true

  validates_format_of :website, :with => URI::regexp(%w(http https))
  validates_format_of :logo_url, :with => URI::regexp(%w(http https))

  delegate :name, :photo_url, to: :bus, prefix: true, allow_nil: true

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
    @funding ||= investments.pluck(:amount).reduce(:+) || 0
  end

  def score
    funding
  end

  def <=>(other)
    other.score <=> score
  end

  def all_milestones
    Milestone.all
  end

  def milestones_pending
    Milestone.where.not(id: milestone_ids)
  end

  def photo_url(options = {})
    if logo_url.present?
      return "#{logo_url}?#{options.to_param}"
    else
      [
        "http://placehold.it/#{options.fetch(:height, 50)}x#{options.fetch(:width, 50)}",
        "http://placekitten.com/g/#{options.fetch(:height, 50)}/#{options.fetch(:width, 50)}"
      ].shuffle.first
    end
  end

end
