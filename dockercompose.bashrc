#!/usr/bin/env bash

dcc() {
  docker compose down && docker compose up ; docker compose down
}

