#!/bin/bash
rm -rf dist
npm i
npm run build
mkdir dist/
cp -v assets/img/favicon.ico dist/
# can't use -o option
go-bindata-assetfs -pkg ui dist/...
mv bindata.go ../../ui/bindata.go
