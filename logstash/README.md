logstash
--------
```
// nginx log format
log_format logstash '$http_host '
                        '$remote_addr [$time_local] '
                        '"$request" $status $body_bytes_sent '
                        '"$http_referer" "$http_user_agent" '
                        '$request_time '
                        '$upstream_response_time';

```

## config

```
logstash:
   image: daocloud.io/koolay/logstash:latest
   ports:
     - "5044:5044"
   volumes:
    - ./ssl:/etc/logstash/ssl
    - ./conf/logstash:/etc/logstash

```

> output sentry 

logstash plugin: [logstash-output-sentry](https://github.com/javiermatos/logstash-output-sentry)

```
output {
    sentry {
        "key" => ""
        "secret" => "9cdff706d64a4f119814a44fc3ee5cdf"
        "project_id" => 22
        "host" => "sentry-test.myysq.com.cn"
        "use_ssl" => false
        "msg" => "message"
        "level_tag" => "error"
        "fields_to_tags" => true
    }
    stdout { codec => rubydebug }
}

```

