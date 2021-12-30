#!/bin/bash

echo -e "\033[0;32mStarting Hugo...\033[0m"

LOCALREPO=docsy

hugo server --theme=$LOCALREPO \
            --environment local \
            --watch
