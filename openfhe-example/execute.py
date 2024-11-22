from ctypes import CFUNCTYPE, c_double
import glob
import os

import llvmlite.binding as llvm

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()
llvm.initialize_native_asmparser()

# llvm.load_library_permanently("/usr/local/lib/libOPENFHEcore.so.1.2.3")

with open("foo.ll", "r") as infile:
  llvm_ir = infile.read()


def create_execution_engine():
  """Create an ExecutionEngine suitable for JIT code generation on the host CPU.

  The engine is reusable for an arbitrary number of modules.
  """
  # Create a target machine representing the host
  target = llvm.Target.from_default_triple()
  target_machine = target.create_target_machine()
  # And an execution engine with an empty backing module
  backing_mod = llvm.parse_assembly("")
  engine = llvm.create_mcjit_compiler(backing_mod, target_machine)
  return engine


def compile_ir(engine, llvm_ir):
  """Compile the LLVM IR string with the given engine.

  The compiled module object is returned.
  """
  # Create a LLVM module object from the IR
  mod = llvm.parse_assembly(llvm_ir)
  mod.verify()
  # Now add the module and make sure it is ready for execution
  engine.add_module(mod)
  engine.finalize_object()
  engine.run_static_constructors()
  return mod


engine = create_execution_engine()
mod = compile_ir(engine, llvm_ir)

import ipdb

ipdb.set_trace()
# Look up the function pointer (a Python int)
func_ptr = engine.get_function_address("foo")
print(func_ptr)

func_ptr = engine.get_function_address(
    "_Z3fooSt10shared_ptrIN8lbcrypto17CryptoContextImplINS0_12DCRTPolyImplIN9bigintdyn9mubintvecINS3_5ubintImEEEEEEEEES_IKNS0_14CiphertextImplIS8_EEESE_"
)
print(func_ptr)


llvm.shutdown()
