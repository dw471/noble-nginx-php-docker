# Ubuntu:Noble Docker Image with Supervisord, Nginx, and PHP 8.3-FPM

This repository contains build scripts and configuration files to create a Docker image based on Ubuntu:Noble, featuring Supervisord, Nginx, and PHP 8.3-FPM.

This image serves as a base for other builds, allowing you to package your website or application on top of it.

## Features

- **Ubuntu:Noble**: A stable and up-to-date base image.
- **Supervisord**: Manages Nginx and PHP processes to ensure they run smoothly.
- **Nginx**: A high-performance web server and reverse proxy, configured to output logs to standard output and error streams:
  - **Access logs**: Pumped to `/dev/stdout`
  - **Error logs**: Pumped to `/dev/stderr`
- **PHP 8.3-FPM**: The latest PHP FastCGI Process Manager, optimized for web applications, with the following extensions:
  - `php8.3-mysql`
  - `php8.3-curl`
  - `php8.3-gd`
  - `php8.3-mbstring`
  - `php8.3-xml`
  - `php8.3-zip`
  - `php8.3-intl`

## Files

- **`build.sh`**: A shell script to automate the build process of the Docker image.
- **`supervisord.conf`**: Configuration file for Supervisord to manage Nginx and PHP-FPM processes.
- **`nginx.conf`**: Basic configuration for Nginx with logging settings that direct logs to `/dev/stdout` and `/dev/stderr`.
- **`Dockerfile`**: Dockerfile containing the instructions to build the Ubuntu:Noble image with all necessary services.

## Usage

### Building the Docker Image

To build the Docker image, clone this repository and run the `build.sh` script:

```bash
git clone https://github.com/dw471/ubuntu-nginx-php-docker.git
cd ubuntu-nginx-php-docker
./build.sh
```

### Running the Docker Container

Once the image is built, you can run it with the following command:

```bash
docker run -d -p 80:80 nginx-base
```
This will start a container with Nginx serving on port 80.

## Customization
You can customize the configuration files (supervisord.conf, nginx.conf, etc.) to suit your specific needs before building the image.

## Contributing
Contributions are welcome! Feel free to fork this repository, make changes, and submit a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
