builder:
	s2i build ./source-to-image obitoquilt/s2i-go-builder:latest s2i latest

runtime:
	s2i build ./source-to-image obitoquilt/s2i-go-builder:latest s2i latest --runtime-image obitoquilt/s2i-go-runtime:latest --runtime-artifact /opt/app-root --copy

build-builder:
	cd golang-s2i/builder && docker build . -t obitoquilt/s2i-go-builder:latest --no-cache && cd -

build-runtime:
	cd golang-s2i/runtime && docker build . -t obitoquilt/s2i-go-runtime:latest --no-cache && cd -