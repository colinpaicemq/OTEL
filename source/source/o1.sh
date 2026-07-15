touch foo.file
touch fooout.file
touch foob.json 
touch file.in.json
truncate -s 0 file.in.json
truncate -s 0 foo.file
truncate -s 0 foob.json 
chmod 777 f*
pc="print-initial-config"
pc=""


docker run --rm  --name ozf \
  --volume "$(pwd)/ofz2.yaml":/otel-config.yaml \
  --volume "$(pwd)/opentransform.yaml":/opentransform.yaml \
  -v "$(pwd)/tempcert.pem":"/server.pem" \
  -v "$(pwd)/tempcert.key.pem":"/server.key.pem" \
  -v "$(pwd)/foo.file":"/fooin.file" \
  -v "$(pwd)/fooout.json":"/fooout.file" \
  -v "$(pwd)/foob.json":"/b.file" \
  -v "$(pwd)/file.in.json":"/file.in" \
  --env COLLECTOR_OTLP_ENABLED=true \
  --publish 4317:4317 \
  --network otel-jaeger-network \
    otel/opentelemetry-collector-contrib:latest ${pc}  --config otel-config.yaml  --config opentransform.yaml 

ls -ltr foo*
