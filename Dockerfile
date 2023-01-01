FROM alpine:3.16

LABEL "com.github.actions.name"="WebDAV Deploy"
LABEL "com.github.actions.description"="Deploy changes from your GitHUb repository using WebDAV."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"
LABEL "maintainer"="Niteo.co <info@niteo.co>"

# User ID of share owner
ENV OWNER=0

# Location of directory where to mount the drive into the container.
ENV WEBDRIVE_MOUNT=~/mnt/webdrive

RUN apk --no-cache add ca-certificates davfs2 tini rsync bash

COPY *.sh /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

# The default is to perform all system-level mounting as part of the entrypoint
# to then have a command that will keep listing the files under the main share.
# Listing the files will keep the share active and avoid that the remote server
# closes the connection.
ENTRYPOINT [ "tini", "-g", "--", "/usr/local/bin/entrypoint.sh" ]
CMD [ "copy.sh" ]
