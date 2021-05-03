#!/bin/bash

printf "import re\n\n\nclass LogsIterator:\n    \
def __init__(self, filepath):\n        \
self.filepath = filepath\n\n    \
def __iter__(self):\n        \
for line in open(self.filepath):\n            \
yield line\n\n\ndata_list, airtime_list, talktime_list = \
[], [], []\nairtime, data, talktime = \
'airtime'.upper(), 'data'.upper(), \
'talktime'.upper()\n\nfor line_ in LogsIterator('$1'):\n    \
if airtime in line_ or data in line_ or talktime in line_:\
	\n        dicts = eval(re.findall('{.*?}', line_)[-1])\
\n        number = dicts.get('msisdn')\
\n\n        if dicts.get('transaction_type') == data:\
\n            data_list.append(number)\n\n        if dicts.get('transaction_type') == airtime:\
\n            airtime_list.append(number)\
\n\n        if dicts.get('transaction_type') == talktime:\
\n            talktime_list.append(number)\n\n\nprint(f'{data.upper()}: {data_list}')\nprint('')\n\n\
print(f'{airtime.upper()}: {airtime_list}')\nprint('')\n\nprint(f'{talktime.upper()}: {talktime_list}')" \
	| /usr/bin/env python3


# echo "import re\n\n\nclass LogsIterator:\n    \
# def __init__(self, filepath):\n        \
# self.filepath = filepath\n\n    \
# def __iter__(self):\n        \
# for line in open(self.filepath):\n            \
# yield line\n\n\ndata_list, airtime_list, talktime_list = \
# [], [], []\nairtime, data, talktime = \
# 'airtime'.upper(), 'data'.upper(), \
# 'talktime'.upper()\n\nfor line_ in LogsIterator('$1'):\n    \
# if airtime in line_ or data in line_ or talktime in line_:\
# 	\n        dicts = eval(re.findall('{.*?}', line_)[-1])\
# \n        number = dicts.get('msisdn')\
# \n\n        if dicts.get('transaction_type') == data:\
# \n            data_list.append(number)\n\n        if dicts.get('transaction_type') == airtime:\
# \n            airtime_list.append(number)\
# \n\n        if dicts.get('transaction_type') == talktime:\
# \n            talktime_list.append(number)\n\n\nprint(f'{data.upper()}: {data_list}')\nprint('')\n\n\
# print(f'{airtime.upper()}: {airtime_list}')\nprint('')\n\nprint(f'{talktime.upper()}: {talktime_list}')" > pinned_v2.py


# echo "`awk '{printf "%s\\n", $0}' pinned_v2.py`" | /usr/bin/env python3
# HOW TO RUN: source q2_v2.sh notifications_q2/notifications.log
