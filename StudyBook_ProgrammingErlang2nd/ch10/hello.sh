#!/bin/sh
erl -noshell -pa . \
  -s hello start \
  -s init stop
