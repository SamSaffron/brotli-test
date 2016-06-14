## brotli-test container

This container can be used to test effect of brotli dynamic compression on assets.

It compares resulting payload size and req/sec between brotli and gzip compressions.


To run, check out the source and run

```
./run
```

You may mount a volume at `/assets/` with your own assets and the container will test.

The testing itself is performed by wrk https://github.com/wg/wrk
