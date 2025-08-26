<img alt="icon" src=".diploi/icon.svg" width="32">

# FastAPI Component for Diploi

Uses Python:3.13-alpine for Docker image.

## Operation

### Development

Will run `pip install -r requirements.txt --no-cache-dir` when component is first initialized, and `fastapi run src/main.py --proxy-headers --port 8000 --reload` when deployment is started.

### Production

Will build a production ready image using Python 3.13-alpine. The image runs `pip wheel --no-cache-dir -r requirements.txt -w /wheels` during build to create wheel packages, then installs them. Once the image runs, `fastapi run src/main.py --proxy-headers --port 8000` is called.

## Links

- [FastAPI documentation](https://fastapi.tiangolo.com/)
- [Python documentation](https://docs.python.org/)
