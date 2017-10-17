.PHONY: run-test run-simple run-openskedge stop start down build db clean test


.run_cleaning:
	rm -rf local_serving

run-test: .run_cleaning stop
	ln -s serving_test local_serving
	docker-compose up -d

run-simple: .run_cleaning stop
	ln -s simple-booking local_serving
	docker-compose up -d

run-openskedge: .run_cleaning stop
	ln -s OpenSkedge-lelefan local_serving
	docker-compose up -d
	docker-compose exec php php app/check.php; true
	docker-compose exec php cp /opt/parameters.yml app/config/parameters.yml
	docker-compose exec php rm -rf app/cache/* && rm -rf app/logs/*
	# docker-compose exec php chmod +a "www-data allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
	# docker-compose exec php chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
	docker-compose exec php chown -R www-data:www-data app/cache && rm -rf app/cache/*
	docker-compose exec php chown -R www-data:www-data app/logs
	docker-compose exec php composer install; true
	docker-compose exec php php . doctrine:database:create; true
	docker-compose exec php php . doctrine:schema:update --force; true
	docker-compose exec php php . doctrine:fixture:load; true
	docker-compose exec php php . --env=dev cache:clear; true
	docker-compose exec php php . --env=dev assets:install; true


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

clean: .run_cleaning
	sudo rm -rf containers/logs

test: clean build run
