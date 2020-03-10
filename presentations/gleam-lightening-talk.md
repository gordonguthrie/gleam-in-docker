# Gleam Lightening talk

### Gordon Guthrie

---

## Advert Break

17 years on the BEAM, man and boy me hearties

Just laid off from Wayfair and looking for work

Erlang, Elixir, LFE, moar gud stuff

@gordonguthrie (Twitter and Github)


---

## What is Gleam?

Gleam is a statically typed language for the BEAM - interoperable with Erlang and Elixir.

Compiles to Erlang, the compiler is written in Rust.

Super early doors.

---

## Examples - Hello World!

```
pub fn integer_addition(a: Int, b: Int) -> Int {
  a + b
}
```

---

# Examples - First Class Functions

```
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
```

---

# Types on the BEAM: problems

Only a subset of classical `Erlang` can be typed - this also pertains to `gleam`

Phil Wadler tried, Phil Wadler failed.

The problem is concurrency

---

# Limitations of typing in DistSys

![distributed typing](./images/distributed_type_checking.png)

---

# ...and in Erlang?

![erlang typing](./images/erlang_type_checking_I.png)

---

# ...same problem as DistSys?

![erlang typing fails](./images/erlang_type_checking_II.png)

---

# Sample solutions


a blended type system that enforces ***compile-time types*** on the ***pure functional*** parts of the code base and generates ***run-time checks*** on ***inter-process side effects*** that codify, standardise and operationalise run time partition and other failure modes for all programmes written in the language

---

# Make a run-time type test

plain `erlang`:

```
PID ! {some, "message"}
```

good old `OTP`:

```
PID ! {'$cast', {some, "message"}}
```

fancy new `gleam` runtime types:

```
PID ! {"abcd1234", {'$cast', {some, "message"}}}
```

Where `"abcd1234"` is a hash of the module/function and the typespect - a sort of frozen type that can be checked at runtime

---

# Read the blog post

https://medium.com/@gordonguthrie/types-on-the-beam-2af8b1cb9be9

also play with 'gleam`:
https://medium.com/@gordonguthrie/types-on-the-beam-2af8b1cb9be9
