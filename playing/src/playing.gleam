pub fn hello_world() {
  "Hello, from playing!"
}

pub fn test() {
  let n = 1
  let m = 2
  integer_addition(n, m)
}

pub fn integer_addition(a: Int, b: Int) -> Int {
  a + b
}

// This function takes a function as an argument
pub fn twice(f: fn(t) -> t, x: t) -> t {
  f(f(x))
}

pub fn add_one(x: Int) -> Int {
  x + 1
}

pub fn add_two(x: Int) -> Int {
  twice(add_one, x)
}

pub fn add_one_2(x: Float) -> Float {
  x +. 1.0
}

pub fn add_two_2(x: Float) -> Float {
  twice(add_one_2, x)
}
