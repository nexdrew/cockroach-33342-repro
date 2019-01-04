#!/usr/bin/env bash

echo -e 'creating comp_plan table'
docker exec -it db1 ./cockroach sql --insecure -e 'CREATE TABLE IF NOT EXISTS test.comp_plan (
  id STRING(36) PRIMARY KEY,
  org_id STRING(36) NOT NULL,
  deleted BOOL NOT NULL DEFAULT false
);'

echo -e '\ncreating quota table'
docker exec -it db1 ./cockroach sql --insecure -e 'CREATE TABLE IF NOT EXISTS test.quota (
  id STRING(36) PRIMARY KEY,
  comp_plan_id STRING(36) NOT NULL REFERENCES test.comp_plan (id),
  deleted BOOL NOT NULL DEFAULT false
);'

echo -e '\nupserting comp_plan'
docker exec -it db1 ./cockroach sql --insecure -e 'UPSERT INTO test.comp_plan
(id, org_id, deleted)
values
('\''cjqicf7x80000otj746mbju1i'\'', '\''cjo63dwkz0000p8j7hytgl4jx'\'', false),
('\''cjqicgqi60000zuj72wr0gm4b'\'', '\''cjo63dwkz0000p8j7hytgl4jx'\'', false)
;'

echo -e '\nupserting quota'
docker exec -it db1 ./cockroach sql --insecure -e 'UPSERT INTO test.quota
(id, comp_plan_id, deleted)
values
('\''cjqichw8u00008hj7e36h8aci'\'', '\''cjqicf7x80000otj746mbju1i'\'', false),
('\''cjqiciirk0000d2j7zyhxatk4'\'', '\''cjqicf7x80000otj746mbju1i'\'', false),
('\''cjqicirbv0000euj7t93xr5mn'\'', '\''cjqicf7x80000otj746mbju1i'\'', false),
('\''cjqicj3x10000hkj7zmmexpo9'\'', '\''cjqicgqi60000zuj72wr0gm4b'\'', false)
;'
