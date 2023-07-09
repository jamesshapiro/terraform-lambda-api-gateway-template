# terraform-lambda-api-gateway-template

Usage examples:

1. GET invocation
```bash
curl -H "x-api-key: YOUR_API_KEY" https://[YOUR_ENDPOINT]/[STAGE_NAME]/resource
```

2. POST invocation
```bash
curl -X POST -H "Content-Type: application/json" -H "x-api-key: YOUR_API_KEY" -d '{"key1":"value1","key2":"value2"}' https://[YOUR_ENDPOINT]/[STAGE_NAME]/resource
```