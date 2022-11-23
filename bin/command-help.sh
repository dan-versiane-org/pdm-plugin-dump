#!/usr/bin/bash

help::commands() {
  echo "$(pdm::show_command 'backup' 'todo.')"
  echo "$(pdm::show_command 'help' 'Show plugin help.')"
  echo "$(pdm::show_command 'restore' 'todo.')"
  echo "$(pdm::show_command 'version' 'Show plugin version.')"
}

pdm::show_usage dump
echo -e "$(help::commands)" | column -t -s "|"
