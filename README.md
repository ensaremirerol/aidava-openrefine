# AIDAVA OpenRefine image

This image is based on the [OpenRefine](http://openrefine.org/) project and contains required extensions for the AIDAVA project.

## Usage

On the root of the repository, run the following command:

```bash
docker-compose up -d
```

OpenRefine will be available at [http://localhost:3333](http://localhost:3333).

To stop the container, run the following command:

```bash
docker-compose down
```

Note that the data will be persisted in the `data` directory.
If you delete the `data` directory, all the data will be lost.

### If you want to change the port

You can change the port by modifying the `docker-compose.yml` file.

```yaml

services:
  openrefine:
    ports:
      - "3333:3333"
```

Change the first `3333` to the port you want to use.

## Update

```bash
docker-compose down
docker-compose pull
docker-compose up
```

## Licenses

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Also used [EasyPi/docker-openrefine](https://github.com/EasyPi/docker-openrefine) as a base.

See OpenRefine [LICENSE](https://github.com/OpenRefine/OpenRefine/blob/master/LICENSE.txt)
