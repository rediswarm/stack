deploy:
	docker stack deploy -c docker-compose.yml rediswarm

destroy:
	docker stack rm rediswarm
