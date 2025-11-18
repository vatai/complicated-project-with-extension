#!/usr/bin/bash
set -x
set -e
cd "$(git rev-parse --show-toplevel)"
rm -rf wheelhouse
uvx cibuildwheel
WHEEL="$(pwd)/wheelhouse/cpwe-42-cp313*manylinux*.whl"
rm -rf /tmp/test_site
mkdir -p /tmp/test_site
cd /tmp/test_site
uv init
uv add $WHEEL
cat > run.py << EOF
import cpwe
import cpwe.foo
print(f"{cpwe.__file__=}")
print(f"{cpwe.foo.__file__=}")
EOF

uv run ./run.py
