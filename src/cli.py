
"""
Command Line Interface for the computor
"""

class CommandLineInterface(object):
    """
    This class represent the command line interface
    """
    def __init__(self):
        """ Init the stack here """
        return

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
            if cmd == 'exit':
                break

    def help(self):
        """
        Affiche l'aide
        """
        print('Welcome to computor')
        print('You can assign variable by writting var [name] = [complexe value]')
