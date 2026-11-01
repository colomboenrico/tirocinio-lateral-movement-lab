#!/bin/bash
docker run --rm -it --network  environment_env-net  --name msf -e DATABASE_URL='postgres://postgres@10.0.0.253:5432/msf' -v "${HOME}/.msf4:/home/msf/.msf4" -p 8443-8500:8443-8500 metasploitframework/metasploit-framework:latest
##!/bin/bash
#docker run --rm -it --network  environment_env-net  --name msf -e DATABASE_URL='postgres://postgres@10.0.0.253:5432/msf?pool=200&timeout=5' -v "${HOME}/.msf4:/home/msf/.msf4" -p 8443-8500:8443-8500 metasploitframework/metasploit-framework:latest