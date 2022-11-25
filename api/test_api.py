from fastapi.testclient import TestClient
from api import app
from unittest import mock

client = TestClient(app)

@mock.patch("api._get_firestore_client", new=mock.MagicMock())
@mock.patch("api._setup_logging", new=mock.MagicMock())
def test_api():
    response = client.post("/app")
    assert response.status_code == 200