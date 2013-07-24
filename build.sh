#!/bin/bash

apidoc  -i src/ -f ".*\\.md$" -o generated_doc/ -t template
