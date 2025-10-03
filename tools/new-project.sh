#! /bin/sh
set -e

if [ -z "$PROJECT_ROOT" ]; then
  echo "Please run helper scripts inside of dev shell."
  exit 1
fi

cp -r $PROJECT_ROOT/template-project $PROJECT_ROOT/$1
cd $PROJECT_ROOT/$1
pio pkg install
pio run -t compiledb
