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
nodemon --delay 1 --watch pyproject.toml --watch requirements.txt --watch ".venv/lib/*" --watch ".venv/lib64/*" --exec "sh -c 'if [ -f pyproject.toml ]; then uv run --isolated --with . --with uvicorn uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload --reload-dir src --reload-exclude \".venv/**\"; elif [ -f requirements.txt ]; then uv run --isolated --with-requirements requirements.txt --with uvicorn uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload --reload-dir src --reload-exclude \".venv/**\"; else uv run --isolated --with uvicorn uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload --reload-dir src --reload-exclude \".venv/**\"; fi'"
```

This will:
- Use nodemon to watch for changes to `pyproject.toml`, `requirements.txt`, and the virtual environment, restarting the server when changes are detected.
- Detect the dependency style and run in an isolated Python environment: with `pyproject.toml` using `uv run --with .`, with `requirements.txt` using `uv run --with-requirements`, or with no config file using uvicorn only.
- Start the FastAPI app using uvicorn on all network interfaces at port 8000.
- Enable hot-reload via uvicorn `--reload`, so the server automatically restarts when Python source files change.

### Production

Builds a production-ready image. During the build, dependencies are installed with `uv sync`. When the container starts, it runs:

```sh
uvicorn src.main:app --host 0.0.0.0 --port 8000 --proxy-headers
```

This uses uvicorn to serve your application on port 8000.

## Links

- [Adding FastAPI to a project](https://docs.diploi.com/building/components/fastapi)
- [FastAPI documentation](https://fastapi.tiangolo.com/)
- [Python documentation](https://docs.python.org/)
- [uv documentation](https://docs.astral.sh/uv/)

