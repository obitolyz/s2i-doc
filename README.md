During the build process, S2I must place `sources` and `scripts` inside the builder image

To keep runtime images slim, S2I enables a multiple-step build processes, where a binary artifact such as an executable or Java WAR file is created in the first builder image, extracted, and injected into a second runtime image that simply places the executable in the correct location for execution.

S2I builder image

## Generating scripts and tools
```bash
s2i create <image name> <destination directory>
```

## Build the image
```bash
s2i build file:///path-to-sample-app <BUILDER_IMAGE_NAME> <OUTPUT_APPLICATION_IMAGE_NAME>
```

Source-to-image (S2I) produces ready-to-run images by injecting source code into a container that prepares that source code to be run. It performs the following steps:

1. Runs the `FROM <builder image>` command

2. Copies the source code to a defined location in the builder image

3. Runs the assemble script in the builder image
4. Sets the run script in the builder image as the default command

https://dev.to/jromero/creating-an-s2i-builder-for-go-and-a-runtime-image-5d56
https://dev.to/jromero/creating-an-s2i-builder-for-go-and-a-runtime-image-5d56
https://github.com/jromero/learning-s2i/tree/master/s2i-golang

## runtime_image

https://github.com/openshift/source-to-image/blob/30d81a9440f30b472bb32e592b12c1a83a396edd/docs/runtime_image.md

- [ ] 日志获取
- [ ] 状态管理
- [ ] 为什么使用 s2i 而不是 Dockerfile ?
- [ ] binary to image ? (kubesphere)
- [ ] s2i 工具只指定 `CMD`，没有指定 `ENTRYPOINT`
- [ ] 支持传入参数
- [ ] s2i 参数含义
- [ ] 支持生成 Dockerfile，实验性功能
- [ ] 代码上传（参考kubesphere）