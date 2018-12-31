#!/bin/bash

buildHeader() {
    checkForAndCreateDir "include"
    buildBody
    writeToFile "${HEADER_BODY}" "${HEADER_PATH}"
}

buildBody() {
read -r -d '' HEADER_BODY << EOF
// ${LOWERCASE_NAME}.h
#ifndef INCLUDED_${UPPERCASE_NAME}
#define INCLUDED_${UPPERCASE_NAME}


#endif
EOF
}
