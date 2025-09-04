from fastapi import FastAPI
app = FastAPI()

@app.get("/")
def read_root(): 
    return "🎊 Welcome to " + "<a href='https://diploi.com'>diploi.com</a>"