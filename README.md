# Dev environment tools

## Requirements

- Linux or MacOS (Cannot test Windows)
- Docker
- Docker compose

## How to start

### Configure directory to serve

By default, docker will serve any directory `local_serving` or any symbolic link
with that name.

#### Using links

Symlink the directory you want to serve to `local_serving`

#### By modifying docker-compose

You can customize `docker-compose.yml` file, section *volumes* for the **php**
container in order to select which website you wanna run.

~~~
volumes:
    - ./local_serving:/var/www/serving_website
~~~

to

~~~
volumes:
    - ./OpenSkedge-lelefan:/var/www/serving_website
~~~ 


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
