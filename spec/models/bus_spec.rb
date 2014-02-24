require 'spec_helper'

describe Bus do
  it "should have multiple teams" do
  end

  it "should have a conductor" do
  end

  it "should have a ranking based on the average of its teams rankings" do
  end
end

=begin
A Bus is a container for a Team.

We need a Bus landing page to highlight all Teams (and their current ranking) on a given Bus

Buses have Conductors (special User)

Buses have their own Ranking determined by an aggregate (or average?) of Team rankings contained on their Bus

User Registers (OAuth)
User Picks Their Bus (try to pull in via Wordpress API, but ask for confirmation)
User Picks Their Team (find or create) - if they were invited, auto-assign their team and ask for confirmation 3a. If user creates team, ask them to invite other team members via e-mail
User completes their profile (try to pull in from WP - bio, photo, twitter, etc.)

=end