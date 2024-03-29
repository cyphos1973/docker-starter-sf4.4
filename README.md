DOCKER-starter-sf4.4 for symfony 4.4

Docker-starter-sf4.4 is a reference app with Symfony 4 created to show how create the containers easier.

![alt text](capture_sf4.png?raw=true "Default page")
## Installations instructions
### Project requirements
- apache (latest version)
- mysql (latest version)
- php : 7.1.33 (value default in Dockerfile but you can choose it in .env)
- phpmyadmin (latest version)
- composer : 2.0.12
- yarn : 1.22.5
- portainer
- maildev (not verified)
- redis (not verified)
- centrifugo (not verified)
- rabbit (not verified)


### Installation
1: Clone the current repository:
```bash
$ git clone https://github.com/cyphos1973/docker-starter-sf4.4.git docker-starter-sf4
```

2: Enter in the directory
```bash
$ cd docker-starter-sf4
```
3: Execute these commands below into your working folder to install the project: (see Makefile)
```bash
$ make install
```
4: Add the profiler
```bash
$ composer req profiler --dev
```

## Usage
1: Open the browser (Google Chrome or Firefox or Safari)

2a: Write :
```bash
$ https://localhost:80
```
2b: For phpmyadmin
```bash
$ https://localhost:8080
```
2c: For portainer
```bash
$ https://localhost:9000
```
3: Modify the values in the file .env when you can to see the change

4: Execute F5 in the browser

## Contribution
Contribution are always welcome and recommended! Here is how:

1: Clone to your machine
 ```bash
 $ git clone https://github.com/cyphos1973/docker-starter-sf4.4.git 
 ```
2: Create a new branch
 ```bash
 $ git checkout -b [branchname] 
 ```
3: Make your changes

4: Create a pull request (PR)

5: See your modifications
 ```bash
 $ git status
 ```
6: See your past commits
 ```bash
 $ git log
 ```
7: Switch to a branch master
 ```bash
 $ git checkout master
 ```
8: Push your PR
 ```bash
 $ git push origin [branchname]
