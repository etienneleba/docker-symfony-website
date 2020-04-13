build-project:
	docker-compose build 

re-build-project: down build-project

up:
	docker-compose up -d

down: 
	docker-compose down

stop: 
	docker-compose stop

cmd?=list
console: 
	docker-compose run --rm php php bin/console $(cmd)

schema-update:
	docker-compose run --rm php php bin/console doctrine:schema:update -f 

cache-clear:
	docker-compose run --rm php php bin/console cache:clear 

composer-require:
	docker-compose run --rm composer require $(req)

composer-install: 
	docker-compose run --rm composer install 

yarn-install:
	# To be log as the node user on the container and be allowed to use the npm/yarn cache (if you have a better way pls tell me)
	LOCAL_USER=1000 docker-compose run --rm node yarn install 

yarn-build:
	docker-compose run --rm node yarn build

yarn-watch: 
	docker-compose run --rm node yarn watch

new-push: build-project

# Change the name of the remote if you need 
deploy-test:
	git push test master

# deploy-prod:
#	git push prod master

#build-symfony-project : composer-install schema-update yarn-install yarn-build cache-clear #if you use symfony encore
build-symfony-project : composer-install schema-update cache-clear

