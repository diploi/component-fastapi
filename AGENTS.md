# FastAPI

A Python API built with [FastAPI](https://fastapi.tiangolo.com/), run by [uvicorn](https://www.uvicorn.org/), with its
dependencies managed by [uv](https://docs.astral.sh/uv/). The app is `app` in `src/main.py`.

## This component

- Add packages with `uv add <package>`, which updates `pyproject.toml` and `uv.lock`. Keep `uvicorn` in the dependencies:
  the start commands run it from the project's `.venv`. Packages only for development go in the `dev` group
  (`uv add --dev <package>`), which staging and production do not install.
- The Python version is the one `.python-version` names, else the `PYTHON_VERSION` env var, else 3.12. uv downloads it,
  so any version works.
- Listens on `PORT`, which Diploi sets to the port of the `app` host in `diploi.yaml` (**8000** unless changed). To change
  the port, change only the host's `port`. Never hardcode one: staging and production count a version as ready once it
  accepts connections on `PORT`, and one that listens elsewhere never becomes ready.
- Development runs `uv run uvicorn` with `--reload`, which reloads on changes in `src/`. Code outside `src/` needs a
  restart, or another `--reload-dir` in `containerCommands.developmentStart`.
- In staging and production the project folder is read-only while the app runs, including `.venv`. The app cannot install
  packages or write files there: data it keeps belongs in another component, and `/tmp` is only for temporary files.

## Environment variables and the runtime build

The app reads env vars when it runs, with `os.environ`. Use an imported `<HOST>_INTERNAL_ENDPOINT` to call another
component from this server.

- Staging and production install each commit on the deployment, once: a restart reuses the install, and a changed env var
  or a new commit installs again. If the install fails, the previous version keeps running and the deployment page shows
  the log. Nothing checks the code during the install, so a broken import shows up as a pod that never gets ready.
- The image holds no code and no Dockerfile is in the project. System packages go into `initScript` (every start, as
  root) or `preBuildScript` (only the install) of the component in `diploi.yaml`.

## Documentation

FastAPI publishes its documentation at <https://fastapi.tiangolo.com/>, and uv at <https://docs.astral.sh/uv/>.
