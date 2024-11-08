import operator


BINOPS_TO_OPERATORS = {
    '+': operator.add,
    '-': operator.sub,
    '*': operator.mul,
    '//': operator.floordiv,
    '/': operator.truediv,
    '%': operator.mod,
    '**': operator.pow,
    '&': operator.and_,
    '|': operator.or_,
    '^': operator.xor,
    '<<': operator.lshift,
    '>>': operator.rshift,
    '==': operator.eq,
    '!=': operator.ne,
    '<': operator.lt,
    '<=': operator.le,
    '>': operator.gt,
    '>=': operator.ge,
    'is': operator.is_,
    'is not': operator.is_not,
    # This one has its args reversed!
    'in': operator.contains,
    '@': operator.matmul,
}

INPLACE_BINOPS_TO_OPERATORS = {
    '+=': operator.iadd,
    '-=': operator.isub,
    '*=': operator.imul,
    '//=': operator.ifloordiv,
    '/=': operator.itruediv,
    '%=': operator.imod,
    '**=': operator.ipow,
    '&=': operator.iand,
    '|=': operator.ior,
    '^=': operator.ixor,
    '<<=': operator.ilshift,
    '>>=': operator.irshift,
    '@=': operator.imatmul,
}


ALL_BINOPS_TO_OPERATORS = {**BINOPS_TO_OPERATORS, **INPLACE_BINOPS_TO_OPERATORS}


UNARY_BUITINS_TO_OPERATORS = {
    '+': operator.pos,
    '-': operator.neg,
    '~': operator.invert,
    'not': operator.not_,
    'is_true': operator.truth,
}

OPERATORS_TO_BUILTINS = {
    operator.add: '+',
    operator.iadd: '+=',
    operator.sub: '-',
    operator.isub: '-=',
    operator.mul: '*',
    operator.imul: '*=',
    operator.floordiv: '//',
    operator.ifloordiv: '//=',
    operator.truediv: '/',
    operator.itruediv: '/=',
    operator.mod: '%',
    operator.imod: '%=',
    operator.pow: '**',
    operator.ipow: '**=',
    operator.and_: '&',
    operator.iand: '&=',
    operator.or_: '|',
    operator.ior: '|=',
    operator.xor: '^',
    operator.ixor: '^=',
    operator.lshift: '<<',
    operator.ilshift: '<<=',
    operator.rshift: '>>',
    operator.irshift: '>>=',
    operator.eq: '==',
    operator.ne: '!=',
    operator.lt: '<',
    operator.le: '<=',
    operator.gt: '>',
    operator.ge: '>=',
    operator.is_: 'is',
    operator.is_not: 'is not',
    # This one has its args reversed!
    operator.contains: 'in',
    # Unary
    operator.pos: '+',
    operator.neg: '-',
    operator.invert: '~',
    operator.not_: 'not',
    operator.truth: 'is_true',
}
