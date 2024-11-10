from bytecode.pipeline import run_compiler


def test_pipeline():
  def foo(a, b):
    return a * a - b * b

  result = run_compiler(foo)
