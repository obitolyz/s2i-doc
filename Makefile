builder:
	s2i build ./source-to-image obitoquilt/s2i-go-builder:latest s2i latest

binary-builder:
	s2i build ./golang-s2i-example-bin obitoquilt/s2i-go-binary-builder:latest binary latest

runtime:
	s2i build ./source-to-image obitoquilt/s2i-go-builder:latest s2i latest --runtime-image obitoquilt/s2i-go-runtime:latest --runtime-artifact /opt/app-root --copy

build-binary-builder:
	cd golang-s2i/binary-builder && docker build . -t obitoquilt/s2i-go-binary-builder:latest --no-cache && cd -

build-builder:
	cd golang-s2i/builder && docker build . -t obitoquilt/s2i-go-builder:latest --no-cache && cd -

build-runtime:
	cd golang-s2i/runtime && docker build . -t obitoquilt/s2i-go-runtime:latest --no-cache && cd -