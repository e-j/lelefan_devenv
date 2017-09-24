# Dev environment tools

## Requirements

- Docker
- Docker compose

## Start

### Configure directory to serve

You can customize `docker-compose.yml` file, section *volumes* for the **php**
container in order to select which website you wanna run.

~~~
volumes:
    - ./serving_test:/var/www/serving_website
~~~

to

~~
volumes:
    - ./OpenSkedge-lelefan:/var/www/serving_website
~~

will serve openskedge.


### Running

In order to run server, you can use the automatized makefile

~~~
make build
make start # Start server in background
~~~

For debug,
~~~
make test
~~~

Will clean previous logs, build images, then make system up with live

### Browsing

1. http://127.0.0.1:8008/ For browse the website
1. http://127.0.0.1:8181/ For browse a PHPMyAdmin of test database

## Ressources

Useful links that help to that project :

- http://blog.mthomas.fr/2016/12/08/environnement-de-developpement-symfony-avec-docker/
- http://geekyplatypus.com/making-your-dockerised-php-application-even-better/ && http://geekyplatypus.com/making-your-dockerised-php-application-even-better/
