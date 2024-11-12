"""The compilation pipeline."""

from bytecode.mlir_emitter import TextualMlirEmitter
from bytecode.numba.core.bytecode import ByteCode, FunctionIdentity
from bytecode.numba.core.interpreter import Interpreter


def run_compiler(function):
  func_id = FunctionIdentity.from_function(function)
  bytecode = ByteCode(func_id)
  print(f"Python bytecode:\n\n{bytecode.dump()}")

  ssa_ir = Interpreter(func_id).interpret(bytecode)
  print(ssa_ir.dump_to_string())

  mlir_textual = TextualMlirEmitter(ssa_ir).emit()
  return mlir_textual
