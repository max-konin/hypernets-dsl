module Hypernets
  module Dsl
    class Hypernet < ActiveResource::Base
      def nodes
        Node.where hypernet_id: self.id
      end

      def graphs
        Graph.where hypernet_id: self.id
      end
    end
  end
end