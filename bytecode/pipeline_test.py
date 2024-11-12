from bytecode.pipeline import run_compiler


def test_pipeline():
  def foo(a, b):
    return a * a - b * b

  result = run_compiler(foo)
  print(result)


def test_branch():
  def foo(a, b):
    if a < b:
      return a
    else:
      return b - 1

  result = run_compiler(foo)
  print(result)
