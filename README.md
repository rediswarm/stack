## About

A simple Docker Stack deployment of High availability with Redis Sentinel.

![image](https://github.com/rediswarm/stack/assets/4363857/5c3be12b-014b-471b-8ffe-37770194456f)

## Usage

By default, this stack was designed to deploy 3 instance of `sentinel` and 5 instance of `redis`.

### Deploy

To deploy the cluster run the following command:

```bash
make deploy
# or deploy with redisinsight
make deploy redisinsight=true
```

### Destroy

To destroy the cluster run the following command:

```bash
make destroy
```

## Troubleshooting

### Sentinel failed to connect to other sentinels in the cluster

If you scale up/down your sentinel service chances are that the new sentinel will not be able to connect to the other sentinels in the cluster. In this case, you need to reset the sentinel cluster.

Sentinels never forget already seen Sentinels, even if they are not reachable for a long time, since we don't want to dynamically change the majority needed to authorize a failover and the creation of a new configuration number.

So in order to remove a Sentinel the following steps should be performed in absence of network partitions:

- Send a SENTINEL RESET * command to all the other Sentinel instances (instead of * you can use the exact master name if you want to reset just a single master). One after the other, waiting at least 30 seconds between instances.
- Check that all the Sentinels agree about the number of Sentinels currently active, by inspecting the output of SENTINEL MASTER mastername of every Sentinel.

${REDISWARM_SECRET}
{{ secret "REDISWARM_SECRET" }}
