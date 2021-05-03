#!/bin/bash

# run: source play.sh notifications.log

# printf "import re\n\n_data, _airtime, _talktime = [], [], []\nwith open('$1') as log_file:\n    for _ in log_file.readlines():\n        if 'AIRTIME' in _ or 'DATA' in _ or 'TALKTTIME' in _:\n            dicts = eval(re.findall('{.*?}', _)[-1])\n\n            if dicts.get('transaction_type') == 'DATA':\n                _data.append(dicts.get('msisdn'))\n\n            if dicts.get('transaction_type') == 'AIRTIME':\n                _airtime.append(dicts.get('msisdn'))\n\n            if dicts.get('transaction_type') == 'TALKTTIME':\n                _talktime.append(dicts.get('msisdn'))\n\n    print(f'data: {_data}')\n    print("")\n\n    print(f'airtime: {_airtime}')\n    print("")\n\n    print(f'talktime: {_talktime}')\n" | /usr/bin/env python3

rm -f extracted.txt
while read p; do
  echo $p | cut -b 49- | /usr/bin/env python3 -c "for _ in eval(input())['log'].split('NOTIFICATION: ')[-1].split('. Params: '): print(eval(_)['transaction_type'], ':', eval(_)['msisdn'])" >> extracted.txt
done <$1

declare -a AIRTIME=()
i=0

declare -a DATA=()
j=0

declare -a TALKTTIME=()
k=0

A="AIRTIME"
D="DATA"
T="TALKTTIME"

while IFS=" : " read line val
do
    if [[ $line == "$A" ]]; then
        AIRTIME+=($val)
    fi

    if [[ $line == "$D" ]]; then
        DATA+=($val)
    fi

    if [[ $line == "$T" ]]; then
        TALKTTIME+=($val)
    fi
done < extracted.txt && rm -f extracted.txt

declare -p AIRTIME
declare -p DATA
declare -p TALKTTIME
