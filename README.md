# n8n

## Dockerを使ったn8nのローカルホスティング

このリポジトリはDockerを使ってn8nをローカルホスティングするための設定を含んでいます。

### 使用方法

1. リポジトリをクローンする
```bash
git clone git@github.com:ganganbiz1/n8n.git
cd n8n-bedrock
```

2. 環境変数を設定する (オプション)
以下の環境変数を設定できます：
- `N8N_HOST`: n8nのホスト名 (デフォルト: localhost)
- `N8N_PROTOCOL`: 使用するプロトコル (http または https、デフォルト: http)
- `WEBHOOK_URL`: Webhookのベースとなる URL (デフォルト: http://localhost:5678/)

3. makeコマンドでn8nを操作する

利用可能なコマンド：
```bash
make help     # 使用方法を表示
make start    # n8nコンテナを起動
make stop     # n8nコンテナを停止
make logs     # n8nコンテナのログを表示
make status   # n8nコンテナのステータスを表示
```

4. n8nにアクセスする
ブラウザで http://localhost:5678 にアクセスすると、n8nのインターフェースが表示されます。

初期認証情報:
- ユーザー名: admin
- パスワード: password

本番環境では必ずパスワードを変更してください。

### データの永続化

n8nのデータは `./n8n-data` ディレクトリに保存されます。

### コンテナの停止

```bash
docker-compose down
```
