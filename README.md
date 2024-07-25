# docker-inpx-web

[inpx-web](https://github.com/bookpauk/inpx-web) is a web server for searching in .inpx files.

.inpx is an index file for export/import information about books from online libraries to MyHomeLib/freeLib/LightLib

## Supported Architectures

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ❌ | |
| armhf | ❌ | |

## Usage

```yaml
---
services:
  inpx-web:
    image: ghcr.io/dekan/inpx-web:latest
    container_name: inpx-web
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/fb2/files:/library:ro
      - /path/to/data:/data
      - /path/to/catalog.inpx:/catalog.inpx:ro
    ports:
      - 12380:12380
    restart: unless-stopped
```

## Updating Info

* Update images:
    * All images:

        ```bash
        docker-compose pull
        ```

    * Single image:

        ```bash
        docker-compose pull inpx-web
        ```

* Update containers:
    * All containers:

        ```bash
        docker-compose up -d
        ```

    * Single container:

        ```bash
        docker-compose up -d inpx-web
        ```

* You can also remove the old dangling images:

    ```bash
    docker image prune
    ```
