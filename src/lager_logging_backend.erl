%% -*- tab-width: 4;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 et
%% ----------------------------------------------------------------------------
%%
%% Copyright (c) 2000 - 2012 Tim Watson.
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in
%% all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
%% IN THE SOFTWARE.
%% ----------------------------------------------------------------------------
-module(lager_logging_backend).

-behaviour(logging_backend).

-export([start/1]).
-export([levels/0]).
-export([log/4]).

-spec start(Args :: term()) -> {ok, pid()} | {ok, pid(), term()} | ignore.
start(Args) ->
    lager_app:start(normal, Args).

-spec levels() -> [atom()].
levels() ->
    [debug, info, notice, warning, error, critical, alert, emergency].

-spec log(Level :: atom(),
          Meta  :: list(term()) | undefined,
          Fmt   :: string(),
          Data  :: list(term())) -> ok.
log(Level, Meta, Fmt, Data) ->
    lager:log(Level, Meta, Fmt, Data).
