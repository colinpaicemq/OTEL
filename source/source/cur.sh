curl -s http://localhost:9090/api/v1/label/name/values | jq -r ".data[]" | sort

curl -s http://0.0.0.0:9090/metrics

