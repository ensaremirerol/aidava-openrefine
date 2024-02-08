# AIDAVA OpenRefine image

This image is based on the [OpenRefine](http://openrefine.org/) project and contains required extensions for the AIDAVA project.

## Usage

On the root of the repository, run the following command:

```bash
docker-compose up -d
```

To stop the container, run the following command:

```bash
docker-compose down
```

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
