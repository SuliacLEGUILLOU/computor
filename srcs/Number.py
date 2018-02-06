"""
Module de gestion des nombres complexes
"""
class Number(object):
    """
    Representation d'un nombre complexe real + i * imag
    """
    def __init__(self):
        self.real = 0
        self.imag = 0

    def add(self, target):
        """
        Add two Number
        """
        self.real += target.real
        self.imag += target.imag

    def sub(self, target):
        """
        subsctract two Number
        """
        self.real -= target.real
        self.imag -= target.imag

    def mul(self, target):
        """
        Multiply two Number
        """
        self.real = self.real * target.real - self.imag * target.imag
        self.imag = self.imag * target.real + self.imag * target.real

    def div(self, target):
        """
        Multiply two Number
        """
        self.real = (self.real * target.real + self.imag * target.imag) / (target.real * target.real
        self.imag = self.imag * target.real + self.imag * target.real
