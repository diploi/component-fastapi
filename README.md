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

Will activate a virtual environment in `.venv` and run `uv sync` when component is first initialized, and `python src/main.py` when deployment is started.

### Production

Will build a production ready image. Image runs `uv sync` when being created. Once the image runs, `python src/main.py` is called.

## Links

- [FastAPI documentation](https://fastapi.tiangolo.com/)
- [Python documentation](https://docs.python.org/)
- [uv documentation](https://docs.astral.sh/uv/)
