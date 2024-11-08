from bytecode.pipeline import run_compiler


def test_pipeline():
  def foo(a, b):
    return a * a - b * b

  import ipdb

  ipdb.set_trace()
  result = run_compiler(foo)
