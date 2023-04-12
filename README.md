http-echo
=========
HTTP Echo is a small web server that serves the contents it was started with as an HTML page.

```
podman run -ti --rm -p 8080:8080 ghcr.io/abelaska/http-echo:latest
```
or
```
podman run -ti --rm -p 8080:8080 -e MESSAGE=ok -e PORT=8080 ghcr.io/abelaska/http-echo:latest
```

Then visit http://localhost:8080/ in your browser.


# Build

```
make build push
```