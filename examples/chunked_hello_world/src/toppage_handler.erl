%% Feel free to use, reuse and abuse the code in this file.

%% @doc Chunked hello world handler.
-module(toppage_handler).

-export([init/2]).

init(Req, Opts) ->
	cowboy_req:stream_reply(200, Req),
	cowboy_req:stream_body("Hello\r\n", nofin, Req),
	timer:sleep(1000),
	cowboy_req:stream_body("World\r\n", nofin, Req),
	timer:sleep(1000),
	cowboy_req:stream_body("Chunked!\r\n", fin, Req),
	{ok, Req, Opts}.
