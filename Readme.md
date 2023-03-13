# WebDAV Deploy Action

Sync your GitHub repository with your store on WooCart.com. / Any WebDAV Support Platform

## Inputs

### `url`

**Required** The URL of WebDAV server (starting with https://...)

### `username`

**Required** The name of the user.

### `password`

**Required** The password for the user.

### `local`

**Required** Path in GitHub repository to sync.

### `remote`

**Required** Path on remote to sync into.

### `method`

**Optional** The method to use for syncing. Default is `sync`.

## Example usage

1. Create a `.github/workflows/deploy.yml` file in your GitHub repo, if one doesn't exist already.
2. Add the following code to the `deploy.yml` file.
```yaml
name: Deploy By WebDAV
on:
  push:
    branches:
    - master
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - name: 🚗 Get Latest Code
      uses: actions/checkout@v3
    - name: 🤳 Deploy website
      uses: XPH0816/webdav-deploy-action@v0.3
      with:
        url: ${{ secrets.WEBDAV_URL }}
        username: ${{ secrets.WEBDAV_USERNAME }}
        password: ${{ secrets.WEBDAV_PASSWORD }}
        local: "./"
        remote: "remote_directory/"
```

or

```yaml
name: Deploy By WebDAV
on:
  push:
    branches:
    - master
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - name: 🚗 Get Latest Code
      uses: actions/checkout@v3
    - name: 🤳 Deploy website
      uses: XPH0816/webdav-deploy-action@v0.3
      with:
        url: ${{ secrets.WEBDAV_URL }}
        username: ${{ secrets.WEBDAV_USERNAME }}
        password: ${{ secrets.WEBDAV_PASSWORD }}
        local: "./"
        remote: "remote_directory/"
        method: "copy"
```

3. Create `WEBDAV_URL`, `WEBDAV_USERNAME`, `WEBDAV_PASSWORD` secret using [GitHub Action's Secret](https://developer.github.com/actions/creating-workflows/storing-secrets). You can find these values in WooCart > Settings tab for your store or set for your own server.
