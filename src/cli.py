"""
Command Line Interface for the computor
"""

import re

class CommandLineInterface(object):
    """
    This class represent the command line interface
    """
    def __init__(self):
        """ Init the stack here """
        self.get_variable = re.compile("^var(.*)=(.*)$")
        self.get_function = re.compile("^func(.*)\((.*)\)=(.*)$")
        #self.array_regex = re.compile("^var (.*) = (.*)$")

    def loop(self):
        """
        Boucle sur les input utilisateur pour operer le programme
        """
        while True:
            print('> ', end='')
            try:
                cmd = input()
            except EOFError:
                break
            if cmd == 'exit' or cmd == 'e':
                break

    def help(self):
        """
        Affiche l'aide de l'interface
        """
        print('Welcome to computor')
        print('You can assign variable by writting var [name] = [complexe value]')
