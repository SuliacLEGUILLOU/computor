""" Module of mathematical array """
class Array(object):
    """
    Multidimentionnal Array of Number
    """
    def __init__(self):
        self.data = []

    def add(self, target):
        """ Add another Array to self """
        for (i, table) in enumerate(target.data):
            for (j, val) in enumerate(table):
                self.data[i][j] += val

    def sub(self, target):
        """ Substract another Array to self """
        for (i, table) in enumerate(target.data):
            for (j, val) in enumerate(table):
                self.data[i][j] -= val
