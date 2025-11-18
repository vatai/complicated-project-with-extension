#!/usr/bin/bash
set -x
set -e

rm -rf /tmp/test_site
mkdir -p /tmp/test_site
cd /tmp/test_site
uv init
unzip ../cibw-wheels-ubuntu-latest-0.zip
uv add complicated_project_with_extension-42-cp313-cp313-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl
cat > run.py << EOF
import complicated_project_with_extension
EOF

uv run ./run.py
