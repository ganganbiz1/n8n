.PHONY: up down restart restart-n8n restart-ollama logs logs-n8n logs-ollama pull-llama2 pull-codellama

# 全てのサービスを起動
up:
	@docker-compose up -d --build
	@echo "すべてのサービスを起動しました"

# 全てのサービスを停止
down:
	@docker-compose down
	@echo "すべてのサービスを停止しました"

# 全てのサービスを再起動
restart:
	@echo "すべてのサービスを再起動しています..."
	@docker-compose restart
	@echo "再起動完了"

# n8nのみ再起動
restart-n8n:
	@echo "n8nを再起動しています..."
	@docker-compose restart n8n
	@echo "n8nの再起動完了"

# ollamaのみ再起動
restart-ollama:
	@echo "ollamaを再起動しています..."
	@docker-compose restart ollama
	@echo "ollamaの再起動完了"

# 全てのログを表示
logs:
	@docker-compose logs -f

# n8nのログのみ表示
logs-n8n:
	@docker-compose logs -f n8n

# ollamaのログのみ表示
logs-ollama:
	@docker-compose logs -f ollama

# llama2モデルをダウンロード
pull-llama2:
	@echo "llama2モデルをダウンロードしています..."
	@curl -s -X POST http://localhost:11434/api/pull -d '{"model":"llama2"}'
	@echo "llama2モデルのダウンロード完了"

# codellamaモデルをダウンロード
pull-codellama:
	@echo "codellamaモデルをダウンロードしています..."
	@curl -s -X POST http://localhost:11434/api/pull -d '{"model":"codellama"}'
	@echo "codellamaモデルのダウンロード完了"

# ヘルプ
help:
	@echo "利用可能なコマンド:"
	@echo "  make up              - 全てのサービスを起動"
	@echo "  make down            - 全てのサービスを停止"
	@echo "  make restart         - 全てのサービスを再起動"
	@echo "  make restart-n8n     - n8nのみ再起動"
	@echo "  make restart-ollama  - ollamaのみ再起動"
	@echo "  make logs            - 全てのログを表示"
	@echo "  make logs-n8n        - n8nのログのみ表示"
	@echo "  make logs-ollama     - ollamaのログのみ表示"
	@echo "  make pull-llama2     - llama2モデルをダウンロード"
	@echo "  make pull-codellama  - codellamaモデルをダウンロード" 