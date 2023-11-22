build:
	@docker-compose up -d --build

bash:
	@docker-compose exec php-fpm bash
