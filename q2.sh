#!/bin/bash

printf "import re\n\n_data, _airtime, _talktime = [], [], []\nwith open('$1') as log_file:\n    \
for _ in log_file.readlines():\n        if 'AIRTIME' in _ or 'DATA' in _ or 'TALKTTIME' in _:\n            \
dicts = eval(re.findall('{.*?}', _)[-1])\n\n            if dicts.get('transaction_type') == 'DATA':\n                \
_data.append(dicts.get('msisdn'))\n\n            if dicts.get('transaction_type') == 'AIRTIME':\n                \
_airtime.append(dicts.get('msisdn'))\n\n            if dicts.get('transaction_type') == 'TALKTTIME':\n                \
_talktime.append(dicts.get('msisdn'))\n\n    print(f'data: {_data}')\n    print("")\n\n    \
print(f'airtime: {_airtime}')\n    print("")\n\n    print(f'talktime: {_talktime}')\n" | /usr/bin/env python3
