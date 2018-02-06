import unittest

from srcs.Stack import Stack

class TestStack(unittest.TestCase):
    def test_variable_simple(self):
        stack = Stack()
        stack.add_variable('a', 10)
        stack.add_variable('b', 10)
        stack.add_variable('b', 20)
        stack.add_variable('c', 10)

        assert(stack.get_variable('a') == 10)
        assert(stack.get_variable('b') == 20)
        assert(stack.get_variable('c') == 10)


if __name__ == '__main__':
    unittest.main()