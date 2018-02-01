FROM microsoft/ubuntu-16.04-tfs-2018-docker-17.06.0-ce

# Following current install guide from
# http://www.mono-project.com/download/#download-lin on 2017-12-08
# regarding to the repository sources
RUN echo "deb http://download.mono-project.com/repo/ubuntu xenial main" |\
    tee /etc/apt/sources.list.d/mono-official.list

# This will do:
# * Accept the repository key
# * Get the current package inventory state
# * Install given packages only with required dependencies
# * Cleanup to reduce Docker image size
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF &&\
    apt-get update &&\
    apt-get  -y --no-install-recommends install libcurl3 tzdata unzip curl git-all mono-complete &&\
    apt-get -yqq clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/*