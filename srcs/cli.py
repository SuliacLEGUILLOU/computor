"""
Command Line Interface for the computor
"""
from srcs.Stack import Stack

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
        stack = Stack()

        while True:
            print('> ', end='')
            try:
                cmd = input().strip()
            except EOFError:
                break
            if cmd == 'exit' or cmd == 'e':
                break
            elif cmd == 'help' or cmd == 'h':
                self.help()
            elif cmd == 'print' or cmd == 'p':
                stack.list_all()

    def help(self):
        """
        Affiche l'aide de l'interface
        """
        print('Welcome to computor')
        print('The command line interface does not take argument')
        print('You can assign variable by writting var [name] = [complexe value]')
        print('Use print [varName] to print variable information')
