# Simple symfony docker 

This a docker/docker-compose project to handle a symfony 4/5 project with nginx, php7.2, mariadb and the node container to install symfony encore.

### Starting a new project 

<pre>$ symfony --full new app</pre>

### Deploy to dev or prod environnement

Follow this tutorial to set up a simple automated GIT Deployment : [Link](https://gist.github.com/noelboss/3fe13927025b89757f8fb12e9066f2fa#file-post-receive)


### Ports

By default port 80 is use for the app and port 8080 is use for adminer. Don't forget to open them or close them

### Docker ubuntu 18.4

<pre>$ sudo apt-get update && sudo apt-get docker docker-compose</pre>
<pre>$ sudo chmod 755 -R . </pre>

restart the server

### Sources

- https://knplabs.com/en/blog/how-to-dockerise-a-symfony-4-project
- https://hackernoon.com/a-better-way-to-develop-node-js-with-docker-cd29d3a0093
- https://symfony.com/doc/current/setup/web_server_configuration.html


