# Asserts given env vars are set
# Usage: assert_envs { args }
# eg.  DBHOST DBPORT DBNAME DBUSER
assert_envs() {
    for var in "$@"; do
        if [ -z "${!var}" ]; then
            error "$var environment is required and is not set"
            exit 1
        fi
    done
}
