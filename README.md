<img alt="icon" src=".diploi/icon.svg" width="32">

# FastAPI Component for Diploi

[![launch with diploi badge](https://diploi.com/launch.svg)](https://diploi.com/component/fastapi)
[![component on diploi badge](https://diploi.com/component.svg)](https://diploi.com/component/fastapi)
[![latest tag badge](https://badgen.net/github/tag/diploi/component-fastapi-beta)](https://diploi.com/component/fastapi)


## Operation

### Getting started

1. In the Dashboard, click **Create Project +**
2. Under **Pick Components**, choose **FastAPI**. Here you can also add a frontend framework to create a monorepo app, eg, FastAPI for backend and React+Vite for frontend
3. In **Pick Add-ons**, you can add one or multiple databases to your app
4. Choose **Create Repository** to generate a new GitHub repo
5. Finally, click **Launch Stack**

For more details, check https://diploi.com/blog/hosting_fastapi_apps

### Development

During development, the container installs Node.js and `nodemon` to enable automatic reloads when files change. The development server is started with:

```sh
nodemon --delay 1 --watch pyproject.toml --exec uv run --isolated fastapi dev --host 0.0.0.0 --port 8000 src/main.py
```

This will:
- Activate the virtual environment in `.venv`
- Install dependencies using `uv sync`
- Automatically restart the FastAPI server when relevant files change

### Production

Builds a production-ready image. During the build, dependencies are installed with `uv sync`. When the container starts, it runs:

```sh
fastapi run src/main.py --proxy-headers --port 8000
```

This uses the FastAPI CLI to serve your application on port 8000.

## Links

- [FastAPI documentation](https://fastapi.tiangolo.com/)
- [Python documentation](https://docs.python.org/)
- [uv documentation](https://docs.astral.sh/uv/)

