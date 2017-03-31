require 'spec_helper'

RSpec.describe Hypernets::Dsl::Adapter do

  describe '.config' do
    before { Hypernets::Dsl::Node.site = nil }

    subject do
      Hypernets::Dsl::Adapter.config do |config|
        config.endpoint = 'http://google.com'
      end
    end
    it 'changes instance variables of adapter' do
      expect { subject }.to change { Hypernets::Dsl::Adapter.instance.endpoint }.to 'http://google.com'
    end

    it { expect { subject }.to change { Hypernets::Dsl::Node.site }.to URI('http://google.com') }
  end
end