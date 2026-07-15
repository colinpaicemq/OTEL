docker run --rm  \
  --name prometheus \
  -p 9090:9090 \
  -p 8080:8080 \
  -v $(pwd)/prom2.yaml:/etc/prometheus/prometheus.yml \
  -v $(pwd)/prom2.yaml:/prometheus/prometheus.yml \
  --network otel-jaeger-network \
  prom/prometheus:latest --log.level=debug 
#  --config=/etc/prometheus/prometheus.yml 
  #  -v prometheus_data:/prometheus \
#    -p 8080:8080 \
#  -p 8081:8081 \
#  -v $(pwd)/prometheus.yaml:/etc/prometheus/prometheus.yml \
#   --network otel-jaeger-network \
#  -p 8889:8889 \
