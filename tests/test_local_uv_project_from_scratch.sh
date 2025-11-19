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
from cpwe.foo import UnionMap
obj = UnionMap("[N] -> {}")
print(obj)
EOF

uv run ./run.py
