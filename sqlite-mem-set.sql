-- set_memory.sql
-- Sets SQLite memory/cache to 4MB

-- SQLite cache is configured in PAGES
-- Default page size is 4096 bytes (4KB)
-- 4MB = 4 * 1024 * 1024 bytes = 4,194,304 bytes
-- Number of pages = 4,194,304 / 4096 = 1024 pages

-- PRAGMA page_size = 4096;        -- set page size to 4KB (default)
-- PRAGMA cache_size =  -10485;      -- negative value = size in KB, so -4096 = 4MB
-- PRAGMA cache_size = 1000;      -- negative value = size in KB, so -4096 = 4MB
PRAGMA cache_size = -5120000;
-- PRAGMA cache_size = 10;

-- keep all temp/intermediate data in RAM
PRAGMA temp_store = MEMORY;

-- give SQLite enough RAM for aggregations
-- PRAGMA cache_size = -1048575;    -- 1 GB

-- journal in memory  (no disk writes during query)
PRAGMA journal_mode = MEMORY;


-- Verify settings
PRAGMA page_size;
PRAGMA cache_size;

-- sqlite3 your_database.db < set_memory.sql

-- PRAGMA temp_store;
-- 0 = DEFAULT (usually file)
-- 1 = FILE     ← uses disk
-- 2 = MEMORY   ← uses RAM

-- Force temp operations to memory
-- PRAGMA temp_store = MEMORY;
