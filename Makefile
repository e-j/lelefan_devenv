.PHONY: run stop start down build db clean test

run:
	docker-compose up -d
	docker-compose exec php chown -R www-data:www-data app/cache && rm -rf app/cache/*
	docker-compose exec php chown -R www-data:www-data app/logs
	docker-compose exec php composer install; true
	docker-compose exec php php . doctrine:schema:update --force; true
	docker-compose exec php php . cache:clear; true
	docker-compose exec php php . doctrine:fixture:load; true


stop:
	docker-compose stop

start:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build


db:
	docker-compose exec db mysql -uroot -p"root"

clean:
	sudo rm -rf containers/logs

test: clean build run
