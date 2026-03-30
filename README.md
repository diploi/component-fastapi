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

Link to the full guide https://diploi.com/blog/hosting_fastapi_apps

### Development

During development, the container installs Node.js and `nodemon` to enable automatic reloads when files change. The development server is started with:

```sh
uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload --reload-dir src --reload-dir .venv/lib
```

This can be changed with the `containerCommands.developmentStart` field in `diploi.yaml`.

### Production

Builds a production-ready image. During the build, dependencies are installed with `uv sync`. When the container starts, it runs:

```sh
uvicorn src.main:app --host 0.0.0.0 --port 8000 --proxy-headers
```

This can be changed with the `containerCommands.productionStart` field in `diploi.yaml`.

## Links

- [Adding FastAPI to a project](https://docs.diploi.com/building/components/fastapi)
- [FastAPI documentation](https://fastapi.tiangolo.com/)
- [Python documentation](https://docs.python.org/)
- [uv documentation](https://docs.astral.sh/uv/)
