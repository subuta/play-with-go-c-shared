.PHONY: lib

so:
	docker compose run --rm go bash -c "go build -o lib/libquery.so -buildmode=c-shared lib.go;"

cp:
	cp -r ./lib/* ./example/js
	cp -r ./lib/* ./example/ruby
	cp -r ./lib/* ./example/php
	cp -r ./lib/* ./example/python

lib: so cp

js:
	docker compose run --rm js bash -c "node index.js"

ruby:
	docker compose run --rm ruby bash -c "bundle exec ruby ./index.rb"

php:
	docker compose run --rm php bash -c "php index.php"

python:
	docker compose run --rm python bash -c "python index.py"

go:
	docker compose run --rm go bash -c "LD_LIBRARY_PATH=./lib go run ./example.go"