# ---- Builder Stage ----
FROM python:3.13-alpine AS base

ARG FOLDER=/app

WORKDIR ${FOLDER}

COPY . /app

RUN pip wheel --no-cache-dir -r requirements.txt -w /wheels

# ---- Production Stage ----
FROM base AS production

WORKDIR ${FOLDER}

RUN apk add --no-cache shadow

RUN groupadd -g 1000 devgroup && \
    useradd -u 1000 -g 1000 -m devuser

COPY --from=base /wheels /wheels

RUN chown -R devuser:devgroup /wheels

RUN pip install --no-cache /wheels/*

RUN chown -R devuser:devgroup /app

USER devuser

EXPOSE 8000

CMD ["fastapi", "run", "src/main.py", "--proxy-headers", "--port", "8000"]
