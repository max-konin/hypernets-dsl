module Hypernets
  module Dsl
    class Adapter
      include Singleton

      attr_accessor :endpoint, :auth_token

      def self.config
        instance = Hypernets::Dsl::Adapter.instance

        yield instance

        instance.config_active_resources
      end

      def config_active_resources
        config_active_resource Hypernets::Dsl::Node
        config_active_resource Hypernets::Dsl::Hypernet
        config_active_resource Hypernets::Dsl::Graph
      end

      private
      def config_active_resource(klass)
        klass.site = endpoint
      end
    end
  end
end