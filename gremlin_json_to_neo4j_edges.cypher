CALL apoc.load.json("file:///all_edges.json") YIELD value as file
WITH *
UNWIND file as edges
MATCH (n1:Node {id: edges.inV}), (n2:Node {id: edges.outV})
MERGE (n1)-[:has_relation {id: edges.id, label: edges.label}]->(n2)
