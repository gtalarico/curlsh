# Checksum and Bump Version
CURRENT_VERSION=$(head -n 1 $PWD/VERSION)
info "EXISTING VERSION: ${CURRENT_VERSION}"

# Generate Checksum"
CHECKSUM=$(find . -iname "*.py" -exec md5sum {} + | sort -k 2 | md5sum | awk '{print $1}')

PREVIOUS_CHECKSUM=$(head -n 1 CHECKSUM)
info "EXISTING CHECKSUM: ${PREVIOUS_CHECKSUM}"

if [ "${CHECKSUM}" = "${PREVIOUS_CHECKSUM}" ]; then
    info "Checksum did not change"
else
    warn "CHECKSUM CHANGED"

    parts=$(echo "${CURRENT_VERSION}" | tr '.' ' ')
    minor=$(echo $parts | awk '{print $2}')
    new_minor=$(echo "${minor}+1" | bc)
    NEW_VERSION="0.${new_minor}.0"

    info "VERSION: ${CURRENT_VERSION} > ${NEW_VERSION}"
    info "CHECKSUM: ${PREVIOUS_CHECKSUM} > ${CHECKSUM}"
    echo "${NEW_VERSION}" > "VERSION"
    echo "${CHECKSUM}" > "CHECKSUM"
fi;
