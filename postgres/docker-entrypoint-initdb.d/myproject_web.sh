#!/bin/env bash
psql -U postgres -c "CREATE USER django_user PASSWORD 'django_pass'"
psql -U postgres -c "CREATE DATABASE djangodb OWNER django_user"
