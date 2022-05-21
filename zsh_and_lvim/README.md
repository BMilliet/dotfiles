## Zsh and lvim

This container uses:
* brew (linuxbrew)
* lvim (lunarvim)
* zsh + ohmyzsh (for non-root)

The entry point is root user running bash shell so it's possible to use root without the regular user.
The regular user is called 'tofu' by default and it uses zsh with ohmyzsh.
To switch from root to tofu just use su command.
```bash
su - tofu
```
Inside tofu user there is no need of sudo mostly, you can user brew as the package manager without sudo.
```bash
brew doctor
```

### How to build the image (podman or docker):
```bash
docker build -t zsh_and_lvim:1.0 .
```

### Running the container:
```bash
docker run -it zsh_and_lvim:1.0 bash
```

### Running the container with local volume (mapping current dir):
```bash
docker run -it -v "$PWD":/home/tofu/app zsh_and_lvim:1.0 bash
```
