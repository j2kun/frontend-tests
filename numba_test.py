from numba import njit


@njit
def add(a, b):
    return a + b


import ipdb; ipdb.set_trace()
add(6, 7)
add(7, 8)
