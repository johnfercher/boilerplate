#!/bin/bash
#
# This file is part of the VSS-SDK project.
#
# This Source Code Form is subject to the terms of the GNU GENERAL PUBLIC LICENSE,
# v. 3.0. If a copy of the GPL was not distributed with this
# file, You can obtain one at http://www.gnu.org/licenses/gpl-3.0/.
#

DISTRO=0
RELEASE=0
ARCHITECTURE=0
INSTALLED=0

GET_DISTRO_INFO() {
    DISTRO=`lsb_release -si`
    RELEASE=`lsb_release -sr`
    ARCHITECTURE=`uname -m`
    echo "$DISTRO $RELEASE $ARCHITECTURE"
}

CREATE_BUILD_FOLDER_IF_DOESNT_EXISTS() {
    if [ ! -d build ]
    then
        mkdir -p build
    fi
}

INSTALL() {
    CREATE_BUILD_FOLDER_IF_DOESNT_EXISTS;
    cd build
    cmake ..
    make
    cd ..
}

INSTALL;

