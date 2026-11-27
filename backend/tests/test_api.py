from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_health():
    assert client.get('/health').json()['status'] == 'ok'


def test_positive():
    result = client.post('/analyze', json={'text': 'この製品は最高です'})
    assert result.status_code == 200
    assert result.json()['sentiment'] == 'positive'


def test_negative():
    assert client.post('/analyze', json={'text': '최악이다'}).json()['sentiment'] == 'negative'


def test_neutral():
    assert client.post('/analyze', json={'text': '今日は火曜日'}).json()['sentiment'] == 'neutral'


def test_blank():
    assert client.post('/analyze', json={'text': '   '}).status_code == 422


def test_too_long():
    assert client.post('/analyze', json={'text': 'a' * 5001}).status_code == 422
