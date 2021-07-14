-module(lib_misc).
-export([
  for/3, qsort/1, pythag/1, perms/1, odds_and_evens1/1, odds_and_evens2/1,
  sqrt/1, sleep/1, flush_buffer/0, priority_receive/0
]).


for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1, Max, F)].


% 快速排序
% 1 > L=[23,6,2,9,27,400,78,45,61,82,14].
% [23,6,2,9,27,400,78,45,61,82,14]
% 2 > lib_misc:qsort(L).
% [2,6,9,14,23,27,45,61,78,82,400]
qsort([]) -> [];
qsort([Pivot|T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
  qsort([X || X <- T, X >= Pivot]).


% 勾股定理
% 1 > lib_misc:pythag(16).
% [{3,4,5},{4,3,5}]
% 2 > lib_misc:pythag(30).
% [{3,4,5},{4,3,5},{5,12,13},{6,8,10},{8,6,10},{12,5,13}]
pythag(N) ->
  [
   {A,B,C} ||
   A <- lists:seq(1, N),
   B <- lists:seq(1, N),
   C <- lists:seq(1, N),
   A + B + C =< N,
   A * A + B * B =:= C * C
  ].


% 全排列
% 1 > lib_misc:perms("123").
% ["123","132","213","231","312","321"]
perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L -- [H])].


% 这个函数会遍历 L 列表两次
odds_and_evens1(L) ->
  Odds = [X || X <- L, (X rem 2) =:= 1],
  Evens = [X || X <- L, (X rem 2) =:= 0],
  {Odds, Evens}.


% 这个函数会遍历 L 列表一次
odds_and_evens2(L) ->
  odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H|Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H|Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.


% 带有自定义错误的sqrt
sqrt(X) when X < 0 ->
  error({squareRootNegativeArgument, X});
sqrt(X) ->
  math:sqrt(X).


% sleep 函数，让当前进程挂起 T 毫秒
sleep(T) ->
  receive
  after T ->
    true
  end.

% 清空邮箱
flush_buffer() ->
  receive
    _Any ->
      flush_buffer()
    after 0 ->
      true
  end.

% 优先匹配alarm消息
priority_receive() ->
  receive
    {alarm, X} ->
      {alarm, X}
  after 0 ->
    receive 
      Any ->
        Any
    end
  end.


