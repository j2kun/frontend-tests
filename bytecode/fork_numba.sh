#!/bin/bash

set -e

CURRENT_DIR=$(pwd)

files=(
    "numba/core/__init__.py"
    "numba/core/bytecode.py"
    "numba/core/byteflow.py"
    "numba/core/config.py"
    "numba/core/consts.py"
    "numba/core/controlflow.py"
    "numba/core/errors.py"
    "numba/core/interpreter.py"
    "numba/core/ir.py"
    "numba/core/serialize.py"
    "numba/core/typeconv/__init__.py"
    "numba/core/typeconv/castgraph.py"
    "numba/core/types/__init__.py"
    "numba/core/types/abstract.py"
    "numba/core/types/common.py"
    "numba/core/types/containers.py"
    "numba/core/types/function_type.py"
    "numba/core/types/functions.py"
    "numba/core/types/iterators.py"
    "numba/core/types/misc.py"
    "numba/core/types/npytypes.py"
    "numba/core/types/scalars.py"
    "numba/core/utils.py"
    "numba/misc/__init__.py"
    "numba/misc/special.py"
)

if [ ! -d "/tmp/numba" ]; then
  git clone git@github.com:numba/numba.git /tmp/numba
fi
cd /tmp/numba
git checkout 53e976f1b0c6683933fa0a93738362914bffc1cd

for file in "${files[@]}"
do
    cp -f "$file" "$CURRENT_DIR/$file"
done

cd "$CURRENT_DIR"
rm -rf /tmp/numba

# Fix imports

sed -i 's/from numba/from bytecode.numba/g' numba/**/*.py
sed -i 's/import numba/import bytecode.numba/g' numba/**/*.py

# apply patches in patches/

for patch in patches/*.patch
do
    # -p2 because this script is run from within $PROJECT_ROOT/bytecode/
    patch -p2 < "$patch"
done

# rm -rf /tmp/numba
