#!/usr/bin/bash

handle::dump::restore() {
  local PDM_WORKSPACE_CURRENT_ROOT="$(pdm::workspace::current_path)"
  local DUMP_OUTPUT_PATH="${PDM_WORKSPACE_CURRENT_ROOT}/backup"
  # TODO: add pass to env
  local DUMP_ZIP_PASS="PASS123"
  local FILE_TO_UNZIP="${DUMP_OUTPUT_PATH}/${1}"

  if [ "${1}" == "latest" ]; then
    latest_file=$(ls -t ${DUMP_OUTPUT_PATH}/*.zip | head -n 1)
    latest_file_name=$(basename "${latest_file}" .zip)
    FILE_TO_UNZIP="${DUMP_OUTPUT_PATH}/${latest_file_name}"
  else
    FILE_TO_UNZIP="${DUMP_OUTPUT_PATH}/${1}"
  fi

  # TODO: add if exists params
  # TODO: add if exists file dump
  unzip -P "${DUMP_ZIP_PASS}" -o -d "${PDM_WORKSPACE_CURRENT_ROOT}/projects" "${FILE_TO_UNZIP}"
}

handle::dump::restore $@
