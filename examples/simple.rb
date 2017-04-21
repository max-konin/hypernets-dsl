require 'hypernets/dsl'

Hypernets::Dsl::Adapter.config do |config|
  config.endpoint = 'http://localhost:300/api/v1'
end

hypernet = Hypernets::Dsl::Hypernet.create name: 'S'

nodes = [1..10].map do |i|
  Hypernets::Dsl::Node.create hypernet_id: hypernet, name: "v#{i}"
end

graph = Hypernets::Dsl::Graph.create name: 'G1'

Hypernets::Dsl::Edge.create graph_id: graph.id, node_ids: [nodes[0].id, node[1].id], name: 'e_1_2'
Hypernets::Dsl::Edge.create graph_id: graph.id, node_ids: [nodes[1].id, node[2].id], name: 'e_2_3'
Hypernets::Dsl::Edge.create graph_id: graph.id, node_ids: [nodes[3].id, node[4].id], name: 'e_4_5'


graph = Hypernets::Dsl::Graph.create name: 'G2'

Hypernets::Dsl::Edge.create graph_id: graph.id, node_ids: [nodes[5].id, node[6].id], name: 'e_1_2'
Hypernets::Dsl::Edge.create graph_id: graph.id, node_ids: [nodes[6].id, node[7].id], name: 'e_2_3'
Hypernets::Dsl::Edge.create graph_id: graph.id, node_ids: [nodes[7].id, node[8].id], name: 'e_4_5'