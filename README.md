# Docker repo for playing with gleam

## Introduction

Just lets people play with Gleam out of the box without the whole install dance

## Purpose

Becuz I am doing a lightening talk on gleam

## Scope

The scope of this repo is:

* get a running `Gleam` setup with both `Elixir` and `Erlang` installed
  * and all the `rust` dependencies
* have it set up to be able to pop the Erlang `Observer` app out into an X-Window running on the host
* install a local copy of the `Gleam` book
  * and the tools required to build it
* have a markdown presentation written with `remarkjs`
 to do the actual talk

## How to use

Clone the repo and the submodules:

`git clone --recurse-submodules git@github.com/gordonguthrie`

then build the docker images

`docker-compose build`

and then bring them up

`docker-compose up`

This will run a `docker` container (provided you have `docker` installed) inside your console - streaming logs back to it (ie not detached)

In another shell you can attach to that running `docker` container

`./start_gleam.sh`

This repo is mounted inside the container at `/gleam` any projects created there will be reflected on your host operating system's file system.

You can build the `Gleam` book inside your docker container. The source code points to my for of the repo.

## Running the prezzo

There is a presentation written in Markdown in this repo at `$ROOT/presentations`. Instructions on how to run it are given in the `README.md` in there.
