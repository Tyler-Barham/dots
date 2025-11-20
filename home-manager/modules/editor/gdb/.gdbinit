set print pretty on
set startup-with-shell off

python

import sys, os.path
sys.path.insert(0, os.path.expanduser('~/.gdb'))

import qt5printers
qt5printers.register_printers(gdb.current_objfile())

import gcc.stdlib
gcc.stdlib.register_printers(gdb.current_objfile())

end

