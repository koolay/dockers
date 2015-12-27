logstash
--------
```

log_format main "$http_x_forwarded_for | $time_local | $request | $status | $body_bytes_sent | "
                "$request_body | $content_length | $http_referer | $http_user_agent | $nuid | "
                "$http_cookie | $remote_addr | $hostname | $upstream_addr | $upstream_response_time | $request_time";

```
