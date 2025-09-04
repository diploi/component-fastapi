from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
def read_root(): 
    return """
    <html>
    <head><title>Diploi</title></head>
    <body style="font-family: Arial; text-align: center; padding: 50px; background: #f0f0f0;">
        <h1>🚀 Diploi</h1>
        <p><strong>Deploy Fast, Scale Smart</strong></p>
        <p>Transform your code into production-ready apps in minutes.</p>
        <a href="https://diploi.com" style="background: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">Visit Diploi</a>
    </body>
    </html>
    """