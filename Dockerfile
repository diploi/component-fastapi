# Use a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:python3.13-alpine

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
RUN uv sync --locked --no-dev

# Place executables in the environment at the front of the path
ENV PATH="$FOLDER/.venv/bin:$PATH"

# Reset the entrypoint, don't invoke `uv`
ENTRYPOINT []

EXPOSE 8000
ENV PORT=8000
ENV HOST="0.0.0.0"

CMD ["uvicorn", "src.main:app","--port", "8000", "--proxy-headers"]