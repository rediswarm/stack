compose_files := -c docker-compose.yml
docker_stack_name := rediswarm
replicas := 3

redisinsight := false
ifeq ($(redisinsight), true)
	compose_files += -c docker-compose.redisinsight.yml
endif

ifneq ("$(wildcard docker-compose.override.yml)","")
	compose_files += -c docker-compose.override.yml
endif

deploy:
	docker stack deploy $(compose_files) $(docker_stack_name)

destroy:
	docker stack rm $(docker_stack_name)

scale:
	docker service scale $(docker_stack_name)_replica=$(rediswarm_replicas)
