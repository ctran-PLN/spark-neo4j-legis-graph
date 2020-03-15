MATCH (ca:State {code: "CA"})<-[:REPRESENTS]-(l:Legislator)
MATCH (l)-[:ELECTED_TO]->(senate:Body {type: "Senate"})
MATCH (l)-[:SERVES_ON]->(c:Committee)
RETURN l,c

MATCH (ca:State {code: "CA"})<-[:REPRESENTS]-(l:Legislator)
MATCH (l)-[:ELECTED_TO]->(senate:Body {type: "Senate"})
MATCH (l)-[:SERVES_ON]->(c:Committee {thomasID: "SSAP"})
MATCH (c)<-[:REFERRED_TO]-(b:Bill)
RETURN ca, senate, l, c, b

MATCH (ca:State {code: "CA"})<-[:REPRESENTS]-(l:Legislator)
MATCH (l)-[:ELECTED_TO]->(senate:Body {type: "Senate"})
MATCH (l)-[:SERVES_ON]->(c:Committee)
MATCH (c)<-[:REFERRED_TO]-(b:Bill)
MATCH (b)-[:DEALS_WITH]->(s:Subject)
RETURN ca, senate, l, c, b, s

MATCH (s:State {code: "CA"})<-[:REPRESENTS]-(l:Legislator)
MATCH (l)-[:ELECTED_TO]->(b:Body) WHERE b.type="Senate"
MATCH (l)-[:SERVES_ON]-(c:Committee)<-[:REFERRED_TO]-(bill:Bill)
MATCH (bill)-[r:DEALS_WITH]->(subject:Subject)
WITH count(r) as num, subject
RETURN subject.title AS subject, num ORDER BY num DESC LIMIT 25;
