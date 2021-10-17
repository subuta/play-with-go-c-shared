.PHONY: lib

so:
	docker-compose run --rm go bash -c "go build -o lib/doQuery.so -buildmode=c-shared lib.go;"

cp:
	cp -r ./lib/* ./example/js
	cp -r ./lib/* ./example/ruby
	cp -r ./lib/* ./example/php

lib: so cp

js:
	docker-compose run --rm js node index.js

ruby:
	docker-compose run --rm ruby bundle exec ruby ./index.rb

php:
	docker-compose run --rm php php index.php