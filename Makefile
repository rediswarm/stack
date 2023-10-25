rediswarm_replicas := 3

deploy:
	docker stack deploy -c docker-compose.yml rediswarm

destroy:
	docker stack rm rediswarm

scale:
	docker service scale rediswarm_rediswarm=$(rediswarm_replicas)
