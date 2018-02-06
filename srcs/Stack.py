'''
This class is use to manage the different stack of the programm
'''
class Stack(object):
    var_stack = {}
    function_stack = {}
    array_stack = {}

    def add_variable(self, name, value):
        self.var_stack[name] = value

    def get_variable(self, name):
        return self.var_stack[name]

    def list_all(self):
        '''
        List all object into the stack
        '''
        print('variable:')
        for name in self.var_stack:
            print('{} = {}'.format(name, str(self.var_stack[name])))
