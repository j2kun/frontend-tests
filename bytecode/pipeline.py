"""The compilation pipeline."""

from bytecode.bytecode import ByteCode, FunctionIdentity
from bytecode.interpreter import Interpreter


def run_compiler(function):
  func_id = FunctionIdentity.from_function(function)
  bytecode = ByteCode(func_id)
  print(f"Python bytecode:\n\n{bytecode.dump()}")

  func_ir = Interpreter(func_id).interpret(bytecode)
  return func_ir