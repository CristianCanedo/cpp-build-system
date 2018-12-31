#!/bin/bash

buildNamespace() {
    createSrcAndInclude
    buildNamespaceHeaderBody
    buildNamespaceSourceBody
    writeToFile "${HEADER_BODY}" "${HEADER_PATH}"
    writeToFile "${SOURCE_BODY}" "${SOURCE_PATH}"
}

buildNamespaceHeaderBody() {
read -r -d '' HEADER_BODY << EOF
// ${LOWERCASE_NAME}.h
#ifndef INCLUDED_${UPPERCASE_NAME}
#define INCLUDED_${UPPERCASE_NAME}

namespace ${LOWERCASE_NAME} {
void func();
}

#endif
EOF
}

buildNamespaceSourceBody() {
read -r -d '' SOURCE_BODY << EOF
#include "${LOWERCASE_NAME}.h"

void ${LOWERCASE_NAME}::func()
{
}
EOF
}
