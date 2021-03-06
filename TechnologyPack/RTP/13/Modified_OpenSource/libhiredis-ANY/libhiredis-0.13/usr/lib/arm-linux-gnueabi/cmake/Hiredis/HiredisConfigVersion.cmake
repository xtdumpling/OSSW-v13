set(PACKAGE_VERSION "0.13.3")

string(REPLACE "." ";" HIREDIS_VERSION_COMPONENTS ${PACKAGE_VERSION})
string(REPLACE "." ";" REQUESTED_VERSION_COMPONENTS ${PACKAGE_FIND_VERSION})

list(GET HIREDIS_VERSION_COMPONENTS 0 HIREDIS_VERSION_MAJOR)
list(GET HIREDIS_VERSION_COMPONENTS 1 HIREDIS_VERSION_MINOR)

list(GET REQUESTED_VERSION_COMPONENTS 0 REQUESTED_VERSION_MAJOR)
list(GET REQUESTED_VERSION_COMPONENTS 1 REQUESTED_VERSION_MINOR)

if(("${HIREDIS_VERSION_MAJOR}" EQUAL "${REQUESTED_VERSION_MAJOR}") AND
    (("${HIREDIS_VERSION_MINOR}" EQUAL "${REQUESTED_VERSION_MINOR}") OR
     ("${HIREDIS_VERSION_MINOR}" GREATER "${REQUESTED_VERSION_MINOR}")))
    set(PACKAGE_VERSION_COMPATIBLE TRUE)
    if("${PACKAGE_VERSION}" VERSION_EQUAL "${PACKAGE_FIND_VERSION}")
        set(PACKAGE_VERSION_EXACT TRUE)
    endif()
else()
    set(PACKAGE_VERSION_COMPATIBLE FALSE)
endif()

