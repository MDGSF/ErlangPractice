%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(nif_test1).

-export([load_lib/0, hello/0]).
-on_load(load_lib/0).

load_lib() ->
    Z = erlang:load_nif("./nif_test1", 0),
    erlang:display({z,Z}),
    Z.

hello() ->
      "NIF library not loaded".
