# Copyright 2009 Brian Quinlan. All Rights Reserved.
# Licensed to PSF under a Contributor Agreement.

"""Execute computations asynchronously using threads or processes."""

__author__ = 'Brian Quinlan (brian@sweetapp.com)'

print("PYTHON2!!!!!!!!!!!!!!1\n\n PYTHONON2")

from concurrent_py2.futures._base import (FIRST_COMPLETED,
                                      FIRST_EXCEPTION,
                                      ALL_COMPLETED,
                                      CancelledError,
                                      TimeoutError,
                                      Future,
                                      Executor,
                                      wait,
                                      as_completed)
from concurrent_py2.futures.thread import ThreadPoolExecutor

try:
    from concurrent_py2.futures.process import ProcessPoolExecutor
except ImportError:
    # some platforms don't have multiprocessing
    pass
