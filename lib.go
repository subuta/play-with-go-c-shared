package main

import "C"

import (
	sq "github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"
	"github.com/k0kubun/pp"
	_ "github.com/mattn/go-sqlite3"
	"log"
	"os"
)

type Foo struct {
	Id   int
	Name string
}

//export DoQuery
func DoQuery() {
	os.Remove("./foo.db")

	db, err := sqlx.Open("sqlite3", "./foo.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	sqlStmt := `
	create table foo (id integer not null primary key, name text);
	delete from foo;
	insert into foo (id, name) VALUES (1, 'test');
	`
	_, err = db.Exec(sqlStmt)
	if err != nil {
		log.Printf("%q: %s\n", err, sqlStmt)
		return
	}

	var foos []Foo

	sql, args, _ := sq.Select("*").From("foo").ToSql()

	err = db.Select(&foos, sql, args...)

	pp.Println(foos)
}

func main() {}
