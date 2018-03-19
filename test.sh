#!/bin/bash
#
# This file is part of the VSS-SDK project.
#
# This Source Code Form is subject to the terms of the GNU GENERAL PUBLIC LICENSE,
# v. 3.0. If a copy of the GPL was not distributed with this
# file, You can obtain one at http://www.gnu.org/licenses/gpl-3.0/.
#

EXIT_IF_AN_ERROR_OCCURRED() {
    LAST_CODE=$?;
    if [[ LAST_CODE != 0 ]];
    then
        exit LAST_CODE;
    fi
}

TEST() {
    cd build
    ./tests
    cd ..
}

TEST;
EXIT_IF_AN_ERROR_OCCURRED;

