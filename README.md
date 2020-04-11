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

<pre>$ cd app</pre>
<pre>$ rm -Rf .git</pre>

##### Add the target php version to the composer.json file 

<pre>
"config": {
    "platform": {
      "php": "7.2.5",
      "ext-something": "1"
    }
}
</pre>

##### In the root of your project, create the .env for docker-compose from .env.dist

<pre>$ cp .env.dist .env</pre>

##### Change the values of the .env

- change the user password
- change the database name
- change the ports 
- check your uid (echo $UID to know your uid) and put the value for LOCAL_USER

##### Build the project 

<pre>$ make build-project</pre>

##### Launch the project 

<pre>$ make up</pre>

<br>
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

### Ports

By default port 80 is use for the app and port 8080 is use for adminer. Don't forget to open them or close them
<br><br>

### Install docker ubuntu 18.4

<pre>$ sudo apt-get update && sudo apt-get docker docker-compose</pre>
<pre>$ sudo usermod -aG docker $USER</pre>
<pre>$ sudo chmod 755 -R . </pre>

restart the machine

### Sources

- https://knplabs.com/en/blog/how-to-dockerise-a-symfony-4-project
- https://hackernoon.com/a-better-way-to-develop-node-js-with-docker-cd29d3a0093
- https://symfony.com/doc/current/setup/web_server_configuration.html


### Contribute 

- add tutorial to install docker/docker-compose on the different environment : red hat, centos...
- improve the makefile
- add comments in the dockerfile and makefile

