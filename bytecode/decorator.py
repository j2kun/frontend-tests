"""Decorators that serve as the entrypoint to the pipeline."""

from bytecode.pipeline import run_compiler


def compile_fake(function):
  print("In the compiler!")
  return function


def failed(*args, **kwargs):
  print("Cannot run function because compilation failed.")


def compile(function, compilation_function=run_compiler):
  """Decorator that compiles a function.

  Prototype limitation: do not use on class methods.

  Example:
      @compile
      def foo(a, b):
          return a*a - b*b
  """

  def frontend(*args, **kw):
    if not hasattr(frontend, "function"):
      try:
        print(f"Compiling {function.__name__}")
        compiled = compilation_function(function)
        frontend.function = compiled
      except Exception as e:
        frontend.function = failed
        print(f"Could not compile {function.__name__}: {e}")
        raise e
    return frontend.function(*args, **kw)

  return frontend
