# utils/math_utils.py
"""Utility functions for basic arithmetic operations.

This module provides simple addition and subtraction functions with
basic type checking and error handling.
"""

def _validate_numbers(a, b):
    """Validate that both arguments are numbers (int or float).

    Parameters
    ----------
    a : Any
        First operand.
    b : Any
        Second operand.

    Raises
    ------
    TypeError
        If either ``a`` or ``b`` is not an ``int`` or ``float``.
    """
    if not isinstance(a, (int, float)):
        raise TypeError(f"Argument 'a' must be int or float, got {type(a).__name__}")
    if not isinstance(b, (int, float)):
        raise TypeError(f"Argument 'b' must be int or float, got {type(b).__name__}")


def add(a, b):
    """Return the sum of *a* and *b*.

    Parameters
    ----------
    a : int or float
        First addend.
    b : int or float
        Second addend.

    Returns
    -------
    int or float
        The result of ``a + b``.

    Raises
    ------
    TypeError
        If either argument is not a number.
    """
    _validate_numbers(a, b)
    return a + b


def subtract(a, b):
    """Return the difference of *a* and *b* (``a - b``).

    Parameters
    ----------
    a : int or float
        Minuend.
    b : int or float
        Subtrahend.

    Returns
    -------
    int or float
        The result of ``a - b``.

    Raises
    ------
    TypeError
        If either argument is not a number.
    """
    _validate_numbers(a, b)
    return a - b
