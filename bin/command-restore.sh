#!/usr/bin/bash

handle::dump::restore() {
  local PDM_WORKSPACE_CURRENT_ROOT="$(pdm::workspace::current_path)"
  local DUMP_OUTPUT_PATH="${PDM_WORKSPACE_CURRENT_ROOT}/backup"
  # TODO: add pass to env
  local DUMP_ZIP_PASS="PASS123"

  # TODO: add if exists params
  # TODO: add if exists file dump
  unzip -P "${DUMP_ZIP_PASS}" -o -d "${PDM_WORKSPACE_CURRENT_ROOT}/projects" "${DUMP_OUTPUT_PATH}/${1}"
}

handle::dump::restore $@
