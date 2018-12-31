#!/bin/bash

buildClass() {
    createSrcAndInclude
    buildClassHeaderBody
    buildClassSourceBody
    writeToFile "${HEADER_BODY}" "${HEADER_PATH}"
    writeToFile "${SOURCE_BODY}" "${SOURCE_PATH}"
}

buildClassHeaderBody() {
read -r -d '' HEADER_BODY << EOF
// ${LOWERCASE_NAME}.h
#ifndef INCLUDED_${UPPERCASE_NAME}
#define INCLUDED_${UPPERCASE_NAME}

class ${FILE_NAME} {
private:

public:
    // CREATORS
    ${FILE_NAME}();
}

#endif
EOF
}

buildClassSourceBody() {
read -r -d '' SOURCE_BODY << EOF
#include "${LOWERCASE_NAME}.h"

${FILE_NAME}::${FILE_NAME}()
{
}
EOF
}
