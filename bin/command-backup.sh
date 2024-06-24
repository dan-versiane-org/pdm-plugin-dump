#!/usr/bin/bash

handle::dump::backup() {
  local PDM_WORKSPACE_CURRENT_ROOT="$(pdm::workspace::current_path)"
  local DUMP_CONFIG_FILE="${PDM_WORKSPACE_CURRENT_ROOT}/config/pdm/dump.config"
  local DUMP_OUTPUT_PATH="${PDM_WORKSPACE_CURRENT_ROOT}/backup"
  # TODO: add pass to env
  local DUMP_ZIP_PASS="PASS123"
  local prefix
  local suffix

  for ARG in ${@}; do
    case "${ARG}" in
      --prefix=*)
        _TMP_RESULT=""
        IFS="=" read -a _TMP_RESULT <<< "$ARG"
        prefix="${_TMP_RESULT[1]}_"
        ;;
      --suffix=*)
        _TMP_RESULT=""
        IFS="=" read -a _TMP_RESULT <<< "$ARG"
        suffix="_${_TMP_RESULT[1]}"
        ;;
    esac
  done

  local now=$(date +"%Y%m%d%H%M%S")
  local outputZipFile="${prefix}${now}${suffix}.zip"
  local outputZipFull="${DUMP_OUTPUT_PATH}/${outputZipFile}"
  local config=$(cat $DUMP_CONFIG_FILE)
  local files=""

  for i in ${config[*]}; do
    local result=()
    IFS=";" read -a result <<< "$i"
    files="$files ${result[1]}/${result[0]}"
  done

  mkdir -p ${DUMP_OUTPUT_PATH}
  cd "${PDM_WORKSPACE_CURRENT_ROOT}/projects"
  zip -r --password "${DUMP_ZIP_PASS}" "${outputZipFull}" ${files}
  cd - >/dev/null 2>&1
}

handle::dump::backup ${@}
