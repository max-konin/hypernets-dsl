require "bundler/setup"
require "hypernets/dsl"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Hypernets::Dsl::Adapter.config do |config|
      config.endpoint = 'http://localhost:3000'
    end

    ActiveResource::HttpMock.respond_to do |mock|
      mock.get '/hypernets/1.json', {}, { id: 1, name: 'H1' }.to_json(root: 'hypernets')
      mock.get '/nodes.json?hypernet_id=1', {}, [{id: 1, name: 'v1'}].to_json(root: 'nodes')
      mock.get '/graphs.json?hypernet_id=1', {}, [{id: 1, name: 'G1'}].to_json(root: 'graphs')
    end
  end
end
