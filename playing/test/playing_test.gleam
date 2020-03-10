import playing
import gleam/expect

pub fn hello_world_test() {
  playing.hello_world()
  |> expect.equal(_, "Hello, from playing!")
}
