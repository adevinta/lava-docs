# lava-docs

Visit [https://adevinta.github.io/lava-docs/](https://adevinta.github.io/lava-docs/) 
to see the user documentation.

## Build documentation

### Latest lava version

By default, the build system uses the latest Lava version to generate
the documentation.

```
./build.bash
```

### Lava version or branch

The `LAVA_VERSION` environment variable can be set to a semver or a
branch name of the Lava repository to generate the documentation for a
specific version of Lava.

```
LAVA_VERSION=v0.9.0 ./build.bash
```

### Lava source code

If the `LAVA_PATH` environment variable is set to a directory
containing the source code of Lava.
Then, Lava is built from the source code and used to generate the
documentation.
`LAVA_PATH` takes precedence over `LAVA_VERSION`.

```
LAVA_PATH=/path/to/lava ./build.bash
```

## Run test suite

The following command runs the test suite.

```
./test.bash
```
