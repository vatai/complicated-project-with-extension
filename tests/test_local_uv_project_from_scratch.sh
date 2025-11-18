#!/usr/bin/bash
set -x
set -e
cd "$(git rev-parse --show-toplevel)"
rm -rf wheelhouse
uvx cibuildwheel
WHEEL="$(pwd)/wheelhouse/complicated_project_with_extension-42-cp313-cp313-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
rm -rf /tmp/test_site
mkdir -p /tmp/test_site
cd /tmp/test_site
uv init
uv add "$WHEEL"
cat > run.py << EOF
import complicated_project_with_extension as cpwe
print(f"{cpwe.__file__=}")
EOF

uv run ./run.py
