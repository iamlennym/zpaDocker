# Docker : ZPA Connector #

HOWTO run the ZPA app connector in a docker container.

## Introduction ##
Note : As running ZPA connector in a docker container is not officially supported, do not use this in production. This is only meant to be used for testing/development purposes.


## Steps Required ##

* Clone the repository onto your Mac / Linux machine (e.g. `git clone https://github.com/iamlennym/zpaDocker.git`).
* Copy the provisioning key for the app connector as per https://help.zscaler.com/zpa/about-connectorprovisioningwizard#choosekey.
* Store the provisioning key for the app connector in the file called `provision_key`.

* Build the local_zscaler_zpa docker image:
    - Execute the following commands:
        - `./build.sh` (builds a local docker image for local_zscaler_zpa)
        - `docker images` (Lists local images. Be sure that local_zscaler_zpa is in the list)


            Example output:
            ```
            REPOSITORY         TAG       IMAGE ID       CREATED       SIZE
            local_zscaler_zpa      latest    3decee17090f   5 hours ago   277MB
            ```



* Spin-up the ZPA connector inside a docker container.
    - Execute the following command:
        - `./run.sh`

    - `docker ps` (lists running docker containers)

We should see the container of type `local_zscaler_zpa` in the list.
```
CONTAINER ID   IMAGE           COMMAND        CREATED          STATUS          PORTS     NAMES
f84950da102f   local_zscaler_zpa   "/sbin/init"   14 seconds ago   Up 13 seconds             flamboyant_euclid

```

Once the container is running, we should be able to see the app connector in the ZPA tenant under 'App Connectors'.

## Debugging ##

* Open a shell into the running container:
    -   `docker exec -ti <CONTAINER ID> bash` (Use the id of the local_zscaler_zpa container listed in the step above)

* Tail the /var/log/messages file:
    -   `tail -f /var/log/messages`
