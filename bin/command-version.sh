#!/usr/bin/env bash

handle::dump::version() {
  printf "%s\\n" "$(cat ${PDM_DIR}/plugins/dump/version.md)"
}

handle::dump::version
