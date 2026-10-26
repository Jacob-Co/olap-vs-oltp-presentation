-- set_memory.sql
-- Sets DuckDB memory limit to 4MB

-- DuckDB uses simple byte notation
-- Much simpler than SQLite pragma system

SET memory_limit = '5GB';
SET force_compression = 'Uncompressed';
SET threads=1;
SET temp_directory = '/tmp/duckdb_spill';

-- Verify setting
SELECT current_setting('memory_limit');
SELECT current_setting('force_compression');
SELECT current_setting('threads');

-- duckdb your_database.db < set_memory.sql
