#!/bin/bash

set -e

CURRENT_DIR=$(pwd)

files=(
    "numba/core/__init__.py"
    "numba/core/analysis.py"
    "numba/core/bytecode.py"
    "numba/core/byteflow.py"
    "numba/core/config.py"
    "numba/core/consts.py"
    "numba/core/controlflow.py"
    "numba/core/errors.py"
    "numba/core/interpreter.py"
    "numba/core/ir.py"
    "numba/core/ir_utils.py"
    "numba/core/postproc.py"
    "numba/core/rewrites/__init__.py"
    "numba/core/rewrites/ir_print.py"
    "numba/core/rewrites/registry.py"
    "numba/core/rewrites/static_binop.py"
    "numba/core/rewrites/static_getitem.py"
    "numba/core/rewrites/static_raise.py"
    "numba/core/transforms.py"
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
    "numba/core/typing/__init__.py"
    "numba/core/typing/arraydecl.py"
    "numba/core/typing/asnumbatype.py"
    "numba/core/typing/bufproto.py"
    "numba/core/typing/builtins.py"
    "numba/core/typing/cffi_utils.py"
    "numba/core/typing/cmathdecl.py"
    "numba/core/typing/collections.py"
    "numba/core/typing/context.py"
    "numba/core/typing/ctypes_utils.py"
    "numba/core/typing/dictdecl.py"
    "numba/core/typing/enumdecl.py"
    "numba/core/typing/listdecl.py"
    "numba/core/typing/mathdecl.py"
    "numba/core/typing/npdatetime.py"
    "numba/core/typing/npydecl.py"
    "numba/core/typing/setdecl.py"
    "numba/core/typing/templates.py"
    "numba/core/typing/typeof.py"
    "numba/core/utils.py"
    "numba/misc/__init__.py"
    "numba/misc/special.py"
)

if [ ! -d "/tmp/numba" ]; then
  git clone git@github.com:numba/numba.git /tmp/numba
fi
cd /tmp/numba
# 0.60.0
git checkout 53e976f1b0c6683933fa0a93738362914bffc1cd

for file in "${files[@]}"
do
    cp -f "$file" "$CURRENT_DIR/$file"
done

cd "$CURRENT_DIR"

# Fix imports
sed -i 's/from numba/from bytecode.numba/g' numba/**/*.py
sed -i 's/import numba/import bytecode.numba/g' numba/**/*.py

# Apply custom patches
patch_series=(
    "patches/errors.patch"
    "patches/serialize.patch"
    "patches/intrinsic.patch"
    "patches/exceptions.patch"
    "patches/unpack_single_tuple.patch"
)
for patch in patches/*.patch
do
    # -p2 because this script is run from within $PROJECT_ROOT/bytecode/
    patch -p2 < "$patch"
done

# rm -rf /tmp/numba
