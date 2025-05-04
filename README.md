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

EC2で以下をやった

```
# Update packages
sudo dnf update -y

# Install Docker dependencies
sudo dnf install -y docker

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to the docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Apply group changes (or you can log out and back in)
newgrp docker

# Verify installation
docker version
```

```
# Download Docker Compose binary
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make it executable
sudo chmod +x /usr/local/bin/docker-compose

# Verify installation
docker-compose --version
```

```
# n8n-dataディレクトリが存在しない場合は作成
mkdir -p ./n8n-data

# 権限を適切に設定（nodeユーザーがコンテナ内で使用するUID 1000）
sudo chown -R 1000:1000 ./n8n-data

# 確実に書き込み権限を付与
sudo chmod -R 755 ./n8n-data
```