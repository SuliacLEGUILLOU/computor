import unittest

from srcs.Number import Number

class TestNumber(unittest.TestCase):
    def test_number_simple(self):
        n = Number()
        n.assign(10, 10)
        n1 = Number()
        n1.assign(-5, 10)
        n2 = Number()
        n2.assign(-5, -5)

        self.assertEqual(n.real, n.imag, 10)
        self.assertEqual(n1.real, -5)
        self.assertEqual(n1.imag, 10)
        self.assertEqual(n2.real, n2.imag, -5)

    def test_number_addition(self):
        n = Number()
        n.assign(10, 10)
        n1 = Number()
        n1.assign(-5, 10)
        n2 = Number()
        n2.assign(-5, -5)

        n.add(n)
        n.add(n1)
        n1.add(n2)

        self.assertEqual(n.real, 15)
        self.assertEqual(n.imag, 30)
        self.assertEqual(n1.real, -10)
        self.assertEqual(n1.imag, 5)

    def test_number_substraction(self):
        n = Number()
        n.assign(10, 10)
        n1 = Number()
        n1.assign(-5, 10)
        n2 = Number()
        n2.assign(-5, -5)

        n.sub(n)
        n.sub(n1)
        n1.sub(n2)

        self.assertEqual(n.real, 5)
        self.assertEqual(n.imag, -10)
        self.assertEqual(n1.real, 0)
        self.assertEqual(n1.imag, 15)

    def test_number_multiplication(self):
        n = Number()
        n.assign(10, 10)
        n1 = Number()
        n1.assign(-5, 10)
        n2 = Number()
        n2.assign(-5, -5)
        n3 = Number()
        n3.assign(10, 0)
        n4 = Number()
        n4.assign(0, 10)

        n.mul(n)
        n1.mul(n2)
        n2.mul(n3)
        n2.mul(n4)

        self.assertEqual(n.real, 0)
        self.assertEqual(n.imag, 200)
        self.assertEqual(n1.real, 75)
        self.assertEqual(n1.imag, -25)
        self.assertEqual(n2.real, 500)
        self.assertEqual(n2.imag, -500)