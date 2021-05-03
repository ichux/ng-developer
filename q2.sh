#!/bin/bash

printf "import re\n\nwith open('$1') as log_file:\n    \
dt_, at_, tt = [], [], []\n    for _ in log_file.readlines():\n        \
if 'AIRTIME' in _ or 'DATA' in _ or 'TALKTTIME' in _:\n            \
dicts = eval(re.findall('{.*?}', _)[-1])\n\n            \
if dicts.get('transaction_type') == 'DATA':\n                dt_.append(dicts.get('msisdn'))\n\n            \
if dicts.get('transaction_type') == 'AIRTIME':\n                at_.append(dicts.get('msisdn'))\n\n            \
if dicts.get('transaction_type') == 'TALKTTIME':\n                tt.append(dicts.get('msisdn'))\n\n    \
print(f'data: {dt_}')\n    print("")\n\n    print(f'airtime: {at_}')\n    print("")\n\n    \
print(f'talktime: {tt}')" | /usr/bin/env python3


# printf "import re\n\nwith open('$1') as log_file:\n    \
# dt_, at_, tt = [], [], []\n    for _ in log_file.readlines():\n        \
# if 'AIRTIME' in _ or 'DATA' in _ or 'TALKTTIME' in _:\n            \
# dicts = eval(re.findall('{.*?}', _)[-1])\n\n            \
# if dicts.get('transaction_type') == 'DATA':\n                dt_.append(dicts.get('msisdn'))\n\n            \
# if dicts.get('transaction_type') == 'AIRTIME':\n                at_.append(dicts.get('msisdn'))\n\n            \
# if dicts.get('transaction_type') == 'TALKTTIME':\n                tt.append(dicts.get('msisdn'))\n\n    \
# print(f'data: {dt_}')\n    print("")\n\n    print(f'airtime: {at_}')\n    print("")\n\n    \
# print(f'talktime: {tt}')" > pinned.py


# echo "`awk '{printf "%s\\n", $0}' pinned.py`" | /usr/bin/env python3
# HOW TO RUN: source q2.sh notifications_q2/notifications.log
