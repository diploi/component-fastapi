# ---- Builder Stage ----
FROM python:3.13-slim AS builder

ARG FOLDER=/fastapi

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR $FOLDER

COPY requirements.txt .

RUN pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

COPY . .

# ---- Production Stage ----
FROM builder AS production

ARG FOLDER=/fastapi

RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR $FOLDER

COPY --from=builder /wheels /wheels

RUN pip install --no-cache /wheels/*

RUN chown -R appuser:appuser $FOLDER

USER appuser

EXPOSE 8000

CMD ["fastapi", "run", "src/main.py", "--proxy-headers", "--port", "8000"]
