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