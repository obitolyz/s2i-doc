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

## binary to image
https://www.kubesphere.io/zh/docs/v3.3/project-user-guide/image-builder/binary-to-image/

https://github.com/kubesphere/s2i-binary-container/tree/master

- [ ] 日志获取
- [ ] 状态管理
- [ ] 为什么使用 s2i 而不是 Dockerfile ?
- [ ] binary to image ? (kubesphere)
- [ ] s2i 工具只指定 `CMD`，没有指定 `ENTRYPOINT`
- [ ] 支持传入参数
- [ ] s2i 参数含义
- [ ] 支持生成 Dockerfile，实验性功能
- [ ] 代码上传（参考kubesphere）


Source-to-Image (S2I) 是一个用于构建容器镜像的工具，它主要是用于将源代码直接转化为 Docker 镜像。S2I 的设计使得它能够生成可重复构建、安全并且高效的容器镜像。

使用脚本 (S2I 脚本) 而不是 Dockerfile 有以下几个主要的优势：

1. **简化构建流程**：S2I 脚本可以将编译、打包和其他构建步骤封装起来，使得用户只需要提供源代码就可以创建容器镜像。与 Dockerfile 相比，这种方式可以更简单地构建出应用的 Docker 镜像。

2. **提高安全性**：在 Dockerfile 中，构建过程可能会包含运行在 root 用户权限下的命令，这可能会带来安全风险。与之相比，S2I 构建过程运行在一个隔离的容器中，这个容器是以普通用户权限运行，从而减少了潜在的安全问题。

3. **支持增量构建**：S2I 支持增量构建，这意味着它可以重用之前构建的部分，从而加速构建过程。而 Dockerfile 缺乏这种增量构建的支持。

4. **可重用和可共享**：S2I 脚本可以在不同的应用和项目之间重用，这使得构建流程可以更容易地在团队或者组织之间共享。

然而，尽管 S2I 提供了上述优势，但它并不是在所有情况下都是最佳选择。在某些情况下，使用 Dockerfile 可能会更有优势，例如当你需要更精细的控制构建过程，或者当你的应用需要特殊的构建步骤或者依赖时。