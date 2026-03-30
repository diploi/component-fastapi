FROM ghcr.io/astral-sh/uv:bookworm-slim

# This will be set by the GitHub action to the folder containing this component.
ARG FOLDER=/app

# This will be set by the GitHub action if "PYTHON_VERSION" ENV is set in diploi.yaml
ARG PYTHON_VERSION=3.14

COPY --chown=1000:1000 . /app
WORKDIR ${FOLDER}

ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy
ENV PATH="$FOLDER/.venv/bin:$PATH"
ENV UV_PYTHON=${PYTHON_VERSION}

RUN uv python install ${PYTHON_VERSION} && \
    uv venv .venv && \
    if [ -f pyproject.toml ]; then \
      uv sync --locked --no-dev || uv sync --no-dev; \
    elif [ -f requirements.txt ]; then \
      uv pip install -r requirements.txt; \
    fi

USER 1000:1000

CMD ["uv", "run", "--with", "uvicorn", "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--proxy-headers"]