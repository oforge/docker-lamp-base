## Here we will have ideas and things to come

### idea: copy sourcecode into the named volume for faster io inside the docker container
````docker run --rm -v `pwd`:/src -v my-jenkins-volume:/data busybox cp -r /src /data````

https://stackoverflow.com/questions/37468788/what-is-the-right-way-to-add-data-to-an-existing-named-volume-in-docker
