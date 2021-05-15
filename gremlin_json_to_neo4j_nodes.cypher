CALL apoc.load.json("file:///all_nodes.json") YIELD value as file
WITH *
UNWIND file as nodes
MERGE (r:Node{id: nodes.id, label: nodes.label})
WITH *
UNWIND nodes.properties as properties
UNWIND [k IN KEYS(properties)] AS k
UNWIND [v IN properties[k]] AS v
MERGE (r)-[:has_property]->(p:Property{id: v.id, value: v.value, label: k})
