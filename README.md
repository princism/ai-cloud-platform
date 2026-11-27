# AI Text Analysis Platform

Terraform と CI/CD による AI 推論 API のクラウド構築・運用自動化を学ぶ個人開発プロジェクトです。

## Phase 1 — ローカル開発と CI

GPU 不使用。現段階の感情分類はキーワードベースのベースラインであり、学習済み AI モデルではありません。AWS・Terraform・CD は未実装です。

### Docker (推奨)

```bash
docker compose up --build -d
curl http://localhost:8000/health
curl -X POST http://localhost:8000/analyze -H 'Content-Type: application/json' -d '{"text":"この製品は最高です"}'
docker compose down
```

Swagger UI: http://localhost:8000/docs

### Python 3.12 / WSL2

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-dev.txt
ruff check app tests
python -m pytest -q
uvicorn app.main:app --reload
```

### CI

GitHub Actions は main への push と pull request で lint、単体テスト、Docker build、コンテナの health check を実行します。AWS へのデプロイはまだ行いません。

### GitHub

GitHub で空のリポジトリを作成後、プロジェクトルートで実行します。

```bash
git init -b main
git add .
git commit -m "feat: initialize CPU text analysis API and CI"
git remote add origin https://github.com/YOUR_USERNAME/ai-cloud-platform.git
git push -u origin main
```

次のステップ: [Roadmap](docs/roadmap.md)。
