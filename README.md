# Tech stack "Django+React+Docker"

## Backend Requirements

* Docker
* Docker Compose

## Frontend Requirements

* Node.js (with `npm`)

## Backend local development

* Start the stack with Docker Compose:

```bash
docker-compose up -d
```
or
```bash
sh scripts/build.sh
```

* Now you can open your browser and interact with these URLs:

Frontend, built with Docker, with routes handled based on the path: http://localhost

PGAdmin, PostgreSQL web administration: http://localhost:5050

Backend, JSON based web API based on OpenAPI: http://localhost:8000

**Note**: The first time you start your stack, it might take a minute for it to be ready. While the backend waits for the database to be ready and configures everything. You can check the logs to monitor it.

To check the logs, run:

```bash
docker-compose logs
```

To check the logs of a specific service, add the name of the service, e.g.:

```bash
docker-compose logs backend
```

## Backend local development, additional details

### General workflow

Open your editor at `./backend/app/` (instead of the project root: `./`), so that you see an `./app/` directory with your code inside. That way, your editor will be able to find all the imports, etc.

There is an `.env` file that has some Docker Compose default values that allow you to just run `docker-compose up -d` and start working, while still being able to use and share the same Docker Compose files for deployment, avoiding repetition of code and configuration as much as possible.

### Migrations

As during local development your app directory is mounted as a volume inside the container (set in the file `docker-compose.dev.volumes.yml`), you can also run the migrations with `alembic` commands inside the container and the migration code will be in your app directory (instead of being only inside the container). So you can add it to your git repository.

* Start an interactive session in the backend container:

```bash
docker-compose exec backend bash
```

* If you created a new model for Django application

```bash
python manage.py makemigrations yourappname
```

* After creating migration

```bash
python manage.py migrate
```

## Frontend development

* Enter the `frontend/app` directory, install the NPM packages and start the live server using the `npm` scripts:

```bash
cd frontend/app
npm install
npm start
```

Notice that this live server is not running inside Docker, it is for local development, and that is the recommended workflow. Once you are happy with your frontend, you can build the frontend Docker image and start it, to test it in a production-like environment. But compiling the image at every change will not be as productive as running the local development server.

Then open your browser at http://localhost:3000

Check the file `package.json` to see other available options.