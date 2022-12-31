# WebDAV Deploy Action

Sync your GitHub repository with your store on WooCart.com.

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

### `exclude`

## Example usage

1. Create a `.github/workflows/deploy.yml` file in your GitHub repo, if one doesn't exist already.
2. Add the following code to the `deploy.yml` file.
```yaml
name: Deploy my-plugin
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
      uses: actions/checkout@v2
    - name: 🤳 Deploy website
      uses: xph0816/webdav-deploy-action
      with:
        url: ${{ secrets.WEBDAV_URL }}
        username: ${{ secrets.WEBDAV_USERNAME }}
        password: ${{ secrets.WEBDAV_PASSWORD }}
        local: "./"
        remote: "remote_directory/"
        exclude: "./.git*"
```
3. Create `WEBDAV_URL`, `WEBDAV_USERNAME`, `WEBDAV_PASSWORD` secret using [GitHub Action's Secret](https://developer.github.com/actions/creating-workflows/storing-secrets). You can find these values in WooCart > Settings tab for your store.
