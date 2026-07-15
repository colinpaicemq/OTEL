docker run --rm -ti  --name jaeger2 \
  --env COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  --env COLLECTOR_OTLP_ENABLED=true \
  --env LOG_LEVEL=debug  \
  --publish 16686:16686 \
  --publish 16685:16685 \
  --publish 16687:16687 \
  --publish 8888:8888 \
  --publish 8889:888 \
  -v "$(pwd)/jc.yaml":"/j1.yaml" \
  --network otel-jaeger-network \
  cr.jaegertracing.io/jaegertracing/jaeger:2.19.0  --config j1.yaml 
#  --config jdelta.yaml
#  --publish 4318:4318 \
#  -v "/home/colin/otel/j1.yaml":"/j1.yaml" \
#  jaegertracing/all-in-one:latest
#  -v "/home/colin/otel/j-all-in-one.yaml":"/j2.yaml" \
#  -v "/home/colin/otel2/j-delta.yaml":"/jdelta.yaml" \
#  --network-alias jaeger \
#  --publish 8888:8888 \
#   --network otel-jaeger-network \
#  --publish 8888:8888 \
#  --publish 8889:8889 \
