
FROM python:3.13-slim

ARG FOLDER=/fastapi

RUN apt-get update && apt-get upgrade -y && apt-get clean

RUN useradd -u 1000 -m devuser

WORKDIR $FOLDER

COPY ./requirements.txt $FOLDER/requirements.txt

RUN pip install --no-cache-dir --upgrade -r $FOLDER/requirements.txt

COPY . .

RUN chown -R devuser:devuser $FOLDER

USER devuser

EXPOSE 8000

CMD ["fastapi", "run", "src/main.py", "--proxy-headers", "--port", "8000"]
