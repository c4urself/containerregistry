import sys

if sys.version_info[0] < 3:
    from httplib2_py2_3.python2.httplib2 import *
    from httplib2_py2_3.python2.httplib2 import DEFAULT_MAX_REDIRECTS
    from httplib2_py2_3.python2.httplib2 import CA_CERTS
else:
    from httplib2_py2_3.python3.httplib2 import *
    from httplib2_py2_3.python3.httplib2 import DEFAULT_MAX_REDIRECTS
    from httplib2_py2_3.python3.httplib2 import CA_CERTS
