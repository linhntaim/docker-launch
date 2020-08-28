# Launch application with Docker

## Requirements

Register & Verify Docker account:

https://hub.docker.com/signup

Install Docker:

https://docs.docker.com/install

## Launch

First, duplicate these file, then rename them and change some configuration if needed

```
docker-compose.yml.example      => docker-compose.yml
git.json.example                => git.json
``` 

Launch Docker:

- Windows

```cmd
.\docker-up.bat

:: To flush the database
.\docker-up.bat --db-refesh
```

- Linux

```bash
bash docker-up.sh

# To flush the database
bash docker-up.sh --db-refesh
```

Finally, launch browser and access `http://localhost`. If it shows 404 Not Found Page then it's OK.

## Stop

If not using the Docker, please stop it:

- Windows

```cmd
.\docker-down.bat
```

- Linux

```bash
bash docker-down.sh
```

When launching browser and access `http://localhost`, it shows nothing or network error.

## Stop & Launch

- Windows

```cmd
.\docker-run.bat

:: To flush the database
.\docker-run.bat --db-refesh
```

- Linux

```bash
bash docker-run.sh

# To flush the database
bash docker-run.sh --db-refesh
```

## Flush

To remove Docker's cache:

```bash
# To flush the database
docker volume rm docker_mysql

# To flush the source code
docker volume rm docker_projects
```

** Make sure Docker is down.