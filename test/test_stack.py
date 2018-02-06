import unittest

from srcs.Stack import Stack
from srcs.Number import Number

class TestStack(unittest.TestCase):
    stack = Stack()
    stack.add_variable('a', 10)
    stack.add_variable('b', 10)
    stack.add_variable('c', 10)

    def test_variable_simple(self):
        self.stack.add_variable('b', 20)

        assert(self.stack.get_variable('a') == 10)
        assert(self.stack.get_variable('b') == 20)
        assert(self.stack.get_variable('c') == 10)

    def test_variable_not_defined(self):
        with self.assertRaises(KeyError):
            self.stack.get_variable('undefined')


if __name__ == '__main__':
    unittest.main()