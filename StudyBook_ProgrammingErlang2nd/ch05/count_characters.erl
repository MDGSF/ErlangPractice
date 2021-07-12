-module(count_characters).
-export([count_characters/1]).

count_characters(Str) ->
  count_characters(Str, #{}).

count_characters([H|T], #{ H := N }=X) ->
  count_characters(T, X#{ H := N + 1 });
count_characters([H|T], X) ->
  count_characters(T, X#{ H => 1 });
count_characters([], X) -> X.

