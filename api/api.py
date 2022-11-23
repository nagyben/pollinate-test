import fastapi
import uvicorn

app = fastapi.FastAPI()

@app.get("/app")
async def main():
    return {"message": "hello world"}