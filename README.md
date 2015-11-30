
This requires Docker version 1.9 or greater.

```
docker build \
  --build-arg nginxplus_license_cookie=<find this by inspecting cookies when you are at https://cs.nginx.com/> \
  --build-arg nginxplus_license_secret=<find this by inspecting the URL for cert and private_key at https://cs.nginx.com/> \
  https://github.com/errordeveloper/dockerfile-nginxplus.git
```
