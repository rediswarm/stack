### Connect to Sentinel

```sh
redis-cli -p 26379
```

Run this command on your active sentinel to request a reset to all the sentinels within the cluster.

```sh
sentinel reset *
```
