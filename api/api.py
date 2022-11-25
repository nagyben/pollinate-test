import datetime
import fastapi
import uvicorn
import logging
import google.cloud.firestore as firestore
import google.cloud.logging as cloudlogging
import os

COLLECTION = os.getenv("FIRESTORE_COLLECTION", "default")

app = fastapi.FastAPI()

def _setup_logging() -> None:
    lg_client = cloudlogging.Client()  # type: ignore
    lg_client.setup_logging(log_level=logging.INFO)  # type: ignore


def _get_firestore_client() -> firestore.Client:
    logging.debug("Getting firestore client...")
    return firestore.Client()

@app.post("/app")
async def main():
    _setup_logging()
    db = _get_firestore_client()
    doc = db.collection(COLLECTION).document("0")

    if not doc.get().exists:
        doc.set(
            {
                "dates": [datetime.datetime.now()]
            }
        )
    else:
        dates = doc.get().to_dict()["dates"]
        dates.append(datetime.datetime.now())
        doc.update({"dates": dates})

    return {"result": "ok"}