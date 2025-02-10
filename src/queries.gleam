pub const create_timestamps_table = "
CREATE TABLE IF NOT EXISTS timestamps (
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  name TEXT
)"

pub const insert_now = "
  insert into timestamps (name) values ('startup');
"

pub const select_timestamps = "
  select timestamp, name from timestamps
"
