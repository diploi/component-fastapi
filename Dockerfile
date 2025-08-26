# ---- Builder Stage ----
FROM python:3.13-slim AS builder

ARG FOLDER=/app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR $FOLDER

COPY . $FOLDER

RUN pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

# ---- Production Stage ----
FROM builder AS production

ARG FOLDER=/app

RUN groupadd -g 1000 devgroup && \
    useradd -u 1000 -g 1000 -m devuser

WORKDIR $FOLDER

COPY --chown=devuser:devgroup --from=builder /wheels /wheels

RUN pip install --no-cache /wheels/*

RUN chown -R devuser:devgroup $FOLDER

USER devuser

EXPOSE 8000

CMD ["fastapi", "run", "src/main.py", "--proxy-headers", "--port", "8000"]
