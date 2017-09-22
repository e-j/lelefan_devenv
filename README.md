# Dev environment tools

## Requirements

- Docker
- Docker compose

## Start

You can customize `docker-compose.yml` file, section *volumes* for the **php**
container in order to select which website you wanna run.

~~~
volumes:
    - ./serving_test:/var/www/serving_website
~~~

to

~~
volumes:
    - ./openskedge:/var/www/serving_website
~~

will serve openskedge.


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

## Ressources

Useful links that help to that project :

- http://blog.mthomas.fr/2016/12/08/environnement-de-developpement-symfony-avec-docker/
- http://geekyplatypus.com/making-your-dockerised-php-application-even-better/ && http://geekyplatypus.com/making-your-dockerised-php-application-even-better/
