import sys

if sys.version_info[0] < 3:
    from httplib2_py2_3.python2.httplib2 import *
else:
    from httplib2_py2_3.python3.httplib2 import *
