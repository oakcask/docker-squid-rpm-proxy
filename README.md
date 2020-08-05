# Preconfigured Squid Proxy Server for RPM package Repositories

## Usage

### Start the proxy

~~~
docker build . -t rpm-squid-proxy
docker run --rm -it --name rpm-squid-proxy rpm-squid-proxy
~~~

### yum upgrade through the proxy

~~~
addr="$(docker container inspect --format "{{.NetworkSettings.IPAddress}}" rpm-squid-proxy)"
proxy="http://${addr}:8080/"

docker run --rm -it -e "http_proxy=${proxy}" -e "https_proxy=${proxy}" centos:8 yum -y upgrade
~~~

## Inspired by

- https://unix.stackexchange.com/questions/240010/how-to-create-an-on-demand-rpm-mirror
