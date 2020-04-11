# Docker symfony website

This is a docker/docker-compose project to handle a symfony 4/5 website project. The project is based on nginx, php7.2, mariadb. There are also a node container to handle yarn (for symfony encore) and a composer container to handle composer. The make commands allow you to interact, build and deploy the project easily.  
<br>

### Starting a new project 

##### Install docker 

It depends on your environment, for ubuntu 18.4 see below 

##### Clone this repository 

<pre>$ git clone https://github.com/etienneleba/docker-symfony-website.git</pre>

##### Rename the project 

<pre>$ mv docker-symfony-website new-project-name</pre>

##### Create the symfony website project : app

<pre>$ cd new-project-name</pre>
<pre>$ symfony new --full app</pre>

##### Delete the .git folder in the symfony projet 

<pre>$ rm -Rf app/.git</pre>

##### Delete the app/.env and replace it, the environment variables are gonna be handled by docker

<pre>$ rm app/.env && touch app/.env</pre>

##### Add the target php version to the composer.json file 

<pre>
"config": {
    "platform": {
      "php": "7.2.5",
      "ext-something": "1"
    },
}
</pre>

##### In the root of your project, create the .env for docker-compose from .env.dist

<pre>$ cp .env.dist .env</pre>

##### Change the values of the .env

- change the user password
- change the database name
- change the ports 
- check your uid (echo $UID to know your uid) and put the value for LOCAL_USER
- change APP_SECRET
- check/change the APP_ENV (dev or prod in lowercase)

##### Build the project 

<pre>$ make build-project</pre>

##### Build the symfony project

<pre>$ make build-symfony-project</pre>

##### Launch the project 

<pre>$ make up</pre>

##### Handle symfony encore
- [Install it](https://symfony.com/doc/current/frontend/encore/installation.html)
- Add yarn-install and yarn-build to the make command build-project

<br>

### Deploy to a server

##### On the server
###### Setup a bare git repository 

  - Follow this tutorial to set up a simple automated GIT Deployment : [Link](https://gist.github.com/noelboss/3fe13927025b89757f8fb12e9066f2fa#file-post-receive)

  - Replace the post-receive script by the one of the project

- Install docker 


##### On local
###### Add the bare repository to your local project 

<pre>$ git remote add test ubuntu@your-server:project.git</pre>

###### Deploy to your server

<pre>$ make deploy-test</pre>

<br>

### Ports

By default port 80 is use for the app and port 8080 is use for adminer. Don't forget to open them or close them

<br>

### Install docker ubuntu 18.4

<pre>$ sudo apt-get update && sudo apt-get docker docker-compose</pre>
<pre>$ sudo usermod -aG docker $USER</pre>
<pre>$ sudo chmod 755 -R . </pre>

restart the machine

<br>

### Makefile commands 
- build-project: build the docker-compose project
- up : launch the docker-compose project
- stop : stop the docker-compose project
- down : remove the docker-compose containers
- console : "php bin/console" throught the composer container, you can add a command with the "cmd" option
- schema-update : "php bin/console doctrine:schema:update -f" throught the composer container
- cache-clear : "php bin/console cache:clear" throught the composer container
- composer-require : "composer require" throught the composer container, you can add a package with the "req" option
- composer-install : "composer install" throught the composer container
- yarn-install : "yarn install" throught the node container
- yarn-build : "yarn build" throught the node container
- yarn-watch : "yarn watch" throught the node container, lauch a server which update your assets during dev
- new-push : this command is used by the git hook : post-receive, to update your project on a server
- deploy-test : this command push your code on the server, don't forget to change the remote name or create other commands for each remote
- build-symfony-project : build the symfony project (install, schema update, cache clear)

<br>

### Sources

- https://knplabs.com/en/blog/how-to-dockerise-a-symfony-4-project
- https://hackernoon.com/a-better-way-to-develop-node-js-with-docker-cd29d3a0093
- https://symfony.com/doc/current/setup/web_server_configuration.html

<br>

### Contribute 

- add tutorial to install docker/docker-compose on the different environment : red hat, centos...
- improve the makefile
- add comments in the dockerfile and makefile

