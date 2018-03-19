#!/bin/bash
#
# This file is part of the VSS-SDK project.
#
# This Source Code Form is subject to the terms of the GNU GENERAL PUBLIC LICENSE,
# v. 3.0. If a copy of the GPL was not distributed with this
# file, You can obtain one at http://www.gnu.org/licenses/gpl-3.0/.
#

CREATE_BUILD_FOLDER_IF_DOESNT_EXIST() {
    if [ ! -d build ]
    then
        mkdir -p build
    fi
}

INSTALL() {
    CREATE_BUILD_FOLDER_IF_DOESNT_EXIST;
    cd build
    cmake ..
    make
    cd ..
}

INSTALL;
exit;

