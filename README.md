# Launch application with Docker

## Requirements

Register & Verify Docker account:

https://hub.docker.com/signup

Install Docker:

https://docs.docker.com/install

## Handle

### Settings

First, duplicate these file and rename them and change some configuration inside if needed

```
docker-compose.yml.example      => docker-compose.yml
git.json.example                => git.json
```

By default, Docker will run localhost at `80` port and MySQL at `3306` port.
If it conflicts with your current ports, you can change them in `docker-compose.yml` file.

```
services:
  php:
    ...
    ports:
      - "{put your wanted localhost port}:80"
      - "{put your wanted mysql port}:3306"
```

Change `git.json`:

```
{
    "PROJECT_NAME": "project-name",
    "GIT_USERNAME": "username",
    "GIT_PASSWORD": "password",
    "GIT_BRANCH": "master"
}
```

Docker will automatically pull source code at `GIT_BRANCH` of repository `http://git-gbu.japaneast.cloudapp.azure.com/gbu/{PROJECT_NAME}` using account set by `GIT_USERNAME` and  `GIT_PASSWORD`.
Please change those settings above to retrieve the project from our Gitlab.

**\*\* Note**: Values for `GIT_USERNAME` and `GIT_PASSWORD` should be encoded using [this tool](https://homepage-gbu.azurewebsites.net/back-end/html/url-encode.html).

Create 2 files named `{PROJECT_NAME}.env` `{PROJECT_NAME}.sql` and put them in `resources` folder. 
Contents of 2 files should be edited by Back-end Engineers.

### Launch

To launch Docker:

- Windows

```cmd
:: Launch normally
:: - Database and project's source code will be cached
.\docker-up.bat

:: To flush the database
.\docker-up.bat --db-refresh

:: To flush the projects
.\docker-up.bat --projects-refresh
```

- Linux

```bash
# Launch normally
# - Database and project's source code will be cached
bash docker-up.sh

# To flush the database
bash docker-up.sh --db-refresh

# To flush the projects
bash docker-up.sh --projects-refresh
```

Finally, launch browser and access `http://localhost` (or `http://localhost:{YOUR WANTED PORT IF YOU CHANGED IT}`). If it shows 404 Not Found Page then it's OK.

** Make sure Docker is down by running [Stop](#stop) first or using [Run: Stop & Launch](#run-stop--launch) for a quicker way to launch.

### Stop

If not using the Docker, please stop it:

- Windows

```cmd
.\docker-down.bat
```

- Linux

```bash
bash docker-down.sh
```

When launching browser and access `http://localhost` (or `http://localhost:{YOUR WANTED PORT IF YOU CHANGED IT}`), it shows nothing or network error.

### Run: Stop & Launch

Combine stop and launch flow in one command:

- Windows

```cmd
:: Run normally 
:: - Database and project's source code will be cached
.\docker-run.bat

:: To flush the database
.\docker-run.bat --db-refresh

:: To flush the projects
.\docker-run.bat --projects-refresh
```

- Linux

```bash
# Run normally
# - Database and project's source code will be cached
bash docker-run.sh

# To flush the database
bash docker-run.sh --db-refresh

# To flush the projects
bash docker-run.sh --projects-refresh
```

### Flush

To directly remove Docker's cache for database and project's source code:

```bash
# To flush the database
docker volume rm docker_mysql

# To flush the source code
docker volume rm docker_projects
```

** Make sure Docker is down by running [Stop](#stop) first.