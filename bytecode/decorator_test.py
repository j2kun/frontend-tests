from bytecode.decorator import compile, compile_fake


def test_compile_decorator():
  def foo(a, b):
    return a * a - b * b

  result = compile(foo, compilation_function=compile_fake)
  assert not hasattr(result, "function")
  result(2, 4)
  assert hasattr(result, "function")
  assert result.function == foo
