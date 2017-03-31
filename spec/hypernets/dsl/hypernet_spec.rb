require 'spec_helper'

RSpec.describe Hypernets::Dsl::Hypernet do

  describe '#nodes' do
    subject { Hypernets::Dsl::Hypernet.find(1).nodes }

    it 'returns all nodes in hypernet' do
      expect(subject.map {|n| n.attributes}).to eq [{'id' => 1, 'name' => 'v1'}]
    end
  end

  describe '#graphs' do
    subject { Hypernets::Dsl::Hypernet.find(1).graphs }

    it 'returns all graph in hypernet' do
      expect(subject.map {|n| n.attributes}).to eq [{'id' => 1, 'name' => 'G1'}]
    end
  end
end