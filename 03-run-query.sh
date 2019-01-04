#!/usr/bin/env bash

# echo -e '\nexplain query'
# docker exec -it db1 ./cockroach sql --insecure -e 'EXPLAIN SELECT q.comp_plan_id, count(q.id) AS count
# FROM test.quota AS q
# INNER JOIN test.comp_plan AS p ON p.id = q.comp_plan_id
# WHERE ((p.org_id = '\''cjo63dwkz0000p8j7hytgl4jx'\'') AND (p.deleted = false))
# AND (q.deleted = false)
# GROUP BY q.comp_plan_id
# ;'
# docker exec -it db1 ./cockroach sql --insecure -e 'EXPLAIN(distsql) SELECT q.comp_plan_id, count(q.id) AS count
# FROM test.quota AS q
# INNER JOIN test.comp_plan AS p ON p.id = q.comp_plan_id
# WHERE ((p.org_id = '\''cjo63dwkz0000p8j7hytgl4jx'\'') AND (p.deleted = false))
# AND (q.deleted = false)
# GROUP BY q.comp_plan_id
# ;'

echo -e '\nrunning query'
docker exec -it db1 ./cockroach sql --insecure -e 'SELECT q.comp_plan_id, count(q.id) AS count
FROM test.quota AS q
INNER JOIN test.comp_plan AS p ON p.id = q.comp_plan_id
WHERE ((p.org_id = '\''cjo63dwkz0000p8j7hytgl4jx'\'') AND (p.deleted = false))
AND (q.deleted = false)
GROUP BY q.comp_plan_id
;'

echo -e '\nreview logs:'
cat ./test-data/db1/logs/cockroach.log
