require 'spec_helper'

describe Omniauthable do
  describe ".type_from_email" do
    let(:buspreneur_email_addresses) { %w(buspreneur_1@gmail.com buspreneur_2@gmail.com) }
    let(:conductor_email_addresses) { %w(conductor_1@gmail.com conductor_2@gmail.com) }

    before do
      Buspreneur.stub(:known_email_addresses).and_return(buspreneur_email_addresses)
      Conductor.stub(:known_email_addresses).and_return(conductor_email_addresses)
    end

    it { described_class.type_from_email("buspreneur_1@gmail.com").should eq "Buspreneur" }
    it { described_class.type_from_email("conductor_1@gmail.com").should eq "Conductor" }
    it { described_class.type_from_email("yadda@gmail.com").should eq "Investor" }

  end
end
