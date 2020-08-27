# Launch application with Docker

## Requirements

Register & Verify Docker account:

https://hub.docker.com/signup

Install Docker:

https://docs.docker.com/install

## Launch

First, duplicate these file, then rename them and change some configuration if needed

```
database.sql.example            => database.sql
docker-compose.yml.example      => docker-compose.yml
docker-compose-all.yml.example  => docker-compose-all.yml
git.json.example                => git.json
``` 

Launch Docker:

- Windows

```cmd
cd SOURCE_DIR\.docker
.\docker-up.bat
```

- Linux

```bash
cd SOURCE_DIR/.docker
bash docker-up.sh
```

Finally, launch browser and access `http://localhost`. If it shows 404 Not Found Page then it's OK.

## Stop

If not using the Docker, please stop it:

- Windows

```cmd
cd SOURCE_DIR\.docker
.\docker-down.bat
```

- Linux

```bash
cd SOURCE_DIR/.docker
bash docker-down.sh
```

When launching browser and access `http://localhost`, it shows nothing or network error.
