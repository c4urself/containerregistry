# Copyright 2017 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

def repositories():
    native.new_http_archive(
        name = "httplib2_py2_3",
        url = "https://codeload.github.com/httplib2/httplib2/tar.gz/v0.11.3",
        sha256 = "d9f568c183d1230f271e9c60bd99f3f2b67637c3478c9068fea29f7cca3d911f",
        strip_prefix = "httplib2-0.11.3",
        type = "tar.gz",
        build_file_content = """
py_library(
    name = "httplib2",
    srcs = glob(["**/*.py"]),
    data = [
        "python2/httplib2/cacerts.txt",
        "python3/httplib2/cacerts.txt",
    ],
   visibility = ["//visibility:public"]
)""",
    )

    native.new_http_archive(
        name = "six",
        url = "https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz",
        sha256 = "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5",
        strip_prefix = "six-1.9.0/",
        type = "tar.gz",
        build_file_content = """
# Rename six.py to __init__.py
genrule(
    name = "rename",
    srcs = ["six.py"],
    outs = ["__init__.py"],
    cmd = "cat $< >$@",
)
py_library(
   name = "six",
   srcs = [":__init__.py"],
   visibility = ["//visibility:public"],
)""",
    )

    # Used for parallel execution in containerregistry
    native.new_http_archive(
        name = "concurrent_py2",
        url = "https://codeload.github.com/agronholm/pythonfutures/tar.gz/3.2.0",
        sha256 = "fc959e162a3ea775c827f8a5e1810ecd175dbb986c2b16864b47fe491ad6950b",
        strip_prefix = "pythonfutures-3.2.0/concurrent/",
        type = "tar.gz",
        build_file_content = """
py_library(
   name = "concurrent",
   srcs = glob(["**/*.py"]),
   visibility = ["//visibility:public"]
)""",
    )

    # For packaging python tools.
    native.git_repository(
        name = "subpar",
        remote = "https://github.com/google/subpar",
        commit = "07ff5feb7c7b113eea593eb6ec50b51099cf0261",
    )
