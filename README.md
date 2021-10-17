# play-with-go-c-shared
Testing "buildmode=c-shared"

## Prerequisites

- Docker for Mac(Or other Docker client app)
- Tested with following language versions.
  - Node.js: v10.24.1
  - Ruby: v3.0.2
  - PHP: v7.4

## How to run

```
# Build Docker containers
docker-compose build

# Build shared library ".h/.so" files.
make lib

# Run examples.

## JavaScript
make js

## Ruby
make ruby

## PHP
make php
```

## References

- [Calling Go Functions from Other Languages | by Vladimir Vivien | Learning the Go Programming Language | Medium](https://medium.com/learning-the-go-programming-language/calling-go-functions-from-other-languages-4c7d8bcc69bf)
