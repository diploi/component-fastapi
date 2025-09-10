from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
def read_root(): 
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>FastAPI</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <style>
        * {
            font-family: sans-serif;
            font-size: 16px;
        }

        html,
        body {
            margin: 0;
            min-height: 100vh;
            background: #202328;
            color: #fff;
        }

        body {
            display: flex;
            flex-direction: column;
            gap: 8px;
            padding: 32px;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
        }

        h1 {
            font-size: 24px;
        }

        p,
        form,
        hr {
            max-width: min(400px, 100%);
        }

        p {
            text-align: center;
            opacity: 0.8;
            line-height: 1.5;
        }

        button,
        .button {
            padding: 10px 18px;
            align-self: center;
            text-decoration: none;
            background: #6650fa;
            border-radius: 64px;
            border: none;
            color: #fff;
            cursor: pointer;
        }

        a {
            font-size: inherit;
            color: inherit;
        }

        hr {
            display: block;
            margin: 32px 0;
            width: 100%;
            height: 2px;
            background: #31363f;
            border: none;
        }

        a:last-child {
            margin-top: 32px;
        }

        code {
            font-family: monospace;
            font-size: 14px;
            background: #31363f;
            padding: 2px 4px;
            border-radius: 4px;
        }
        </style>
    </head>
    <body>
        <img
            alt="FastAPI logo"
            src="https://github.com/diploi/component-fastapi/raw/main/.diploi/icon.svg"
            width="64"
            height="64"
        />
        
        <h1>FastAPI</h1>

        <p>
            Your FastAPI application is up and running! You can start editing the code in
            <code>src/main.py</code> to build your backend API. 
            In development stage, FastAPI will automatically reload as you make changes.
            <br><br>
            <b> Install dependencies: </b><br> 
            Please use <code>uv add package_name</code> to add Python packages to your environment.
        </p>

        <hr />

        <a href="https://diploi.com/"
        ><img width="54" height="16" src="https://diploi.com/logo-white.svg"
        /></a>
    </body>
    </html>
    """