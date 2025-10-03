#! /bin/sh
cp -r $PROJECT_ROOT/template-project $PROJECT_ROOT/$1
cd $PROJECT_ROOT/$1
pio pkg install
pio run -t compiledb
