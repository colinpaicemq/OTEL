#  !/bin/sh
l="'.resourceSpans[].scopeSpans[].spans[] | {.traceId, .spanId }'"
l="'.resourceSpans[].scopeSpans[].spans[] | {.traceId, .spanId }'"
jq -r '.resourceSpans[].scopeSpans[].spans[] | [.startTimeUnixNano, .traceId,.spanId, .parentSpanId,.name, .links ]'  file.in.json
