import gleam/dynamic/decode
import gleam/io
import queries
import sqlight

pub fn main() {
  // use conn <- sqlight.with_connection(":memory:")
  let assert Ok(conn) = sqlight.open("file:data.sqlite3")

  let assert Ok(Nil) = sqlight.exec(queries.create_timestamps_table, conn)
  let assert Ok(Nil) = sqlight.exec(queries.insert_now, conn)

  let timestamp_decoder = {
    use timestamp <- decode.field(0, decode.string)
    use name <- decode.field(1, decode.string)
    decode.success(#(timestamp, name))
  }
  let result =
    sqlight.query(
      queries.select_timestamps,
      on: conn,
      with: [],
      expecting: timestamp_decoder,
    )

  io.debug(result)
}
