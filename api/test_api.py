from fastapi.testclient import TestClient
from api import app

client = TestClient(app)


def test_api():
    response = client.get("/app")
    assert response.status_code == 200