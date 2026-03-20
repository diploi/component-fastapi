# Use a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:python3.11-bookworm

# This will be set by the GitHub action to the folder containing this component.
ARG FOLDER=/app

WORKDIR ${FOLDER}

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1

# Copy from the cache instead of linking since it's a mounted volume
ENV UV_LINK_MODE=copy

# Ensure installed tools can be executed out of the box
ENV UV_TOOL_BIN_DIR=/usr/local/bin

COPY . /app

RUN if [ -f requirements.txt ]; then \
    echo "requirements.txt found, installing dependencies with uv pip" && \
    uv venv .venv --clear && \
    uv pip install -r requirements.txt; \
    else \
    echo "Using uv sync for dependency installation" && \
    uv sync --locked --no-dev; \
    fi

RUN uv pip show --python .venv/bin/python uvicorn >/dev/null 2>&1 || \
    uv pip install --python .venv/bin/python uvicorn --link-mode=copy

# Place executables in the environment at the front of the path
ENV PATH="$FOLDER/.venv/bin:$PATH"

# Reset the entrypoint, don't invoke `uv`
ENTRYPOINT []

EXPOSE 8000
ENV PORT=8000
ENV HOST="0.0.0.0"

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--proxy-headers"]