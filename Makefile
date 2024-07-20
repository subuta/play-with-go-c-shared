.PHONY: lib

so:
	docker compose run --rm go bash -c "go build -o lib/libquery.so -buildmode=c-shared lib.go;"
	sudo cp ./swig/* ./lib

cp:
	cp -r ./lib/* ./example/js
	cp -r ./lib/* ./example/ruby
	cp -r ./lib/* ./example/php
	cp -r ./lib/* ./example/python

lib: so cp

js:
	cd example/js && \
    		swig -c++ -javascript -node libquery.i && \
    		node-gyp clean && node-gyp configure && node-gyp build && \
	docker compose run --rm js bash -c "node index.js"

ruby:
	cd example/ruby && \
        		swig -ruby libquery.i && \
        		ruby extconf.rb && make && sudo make install && \
        		gcc -fPIC -shared -o query.so libquery_wrap.c -I/usr/include/ruby-3.0.0 -I/usr/include/x86_64-linux-gnu/ruby-3.0.0 -L. -lquery && \
	docker compose run --rm ruby bash -c "bundle exec ruby ./index.rb"

php:
	cd example/php && \
		swig -php7 libquery.i && \
		gcc -fPIC -shared -o query.so libquery_wrap.c `php-config --includes` -L. -lquery
	docker compose run --rm php bash -c "php index.php"

python:
	cd example/python && \
		swig -python libquery.i && \
		gcc -fPIC -shared -o _query.so libquery_wrap.c -I/usr/include/python3.10 -L. -lquery
	docker compose run --rm python bash -c "python index.py"