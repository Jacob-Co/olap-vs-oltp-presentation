# Seed
- sqlite3 t-sqlite.db < sqlite-seed.sql
- ./duckdb t-duckdb.db < duckdb-seed.sql

# Set memory and start
- ./duckdb t-duckdb.db -cmd ".read duckdb-mem-set.sql"
- sqlite3 t-sqlite.db -cmd ".read sqlite-mem-set.sql"

# Cheat Sheet
- .timer on
- .read olap-test.sql
- .read oltp-test.sql

