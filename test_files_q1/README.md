# Q1.txt
The solution for the *Q1.txt* is contained within the *q1.py* file.

# HOW TO RUN q1.py
1. Python version used *Python 3.8.8*: Due to f-string usage, this project isn't meant to be run on Python 2
2. Create and activate a virtual environment for this project as there are no external libraries used
3. Type
   > python q1.py
4. The output of the Step 3 above gets saved to [Q1-1.csv](Q1-1.csv)

# ASSUMPTIONS MADE FOR OUTPUT RESULTS
1. The [CSV output](test_files_q1/Q1-1.csv) has a header: *Short-code,Number-of-sessions*
2. For airtime purchases, the dialled string is of format `SHORTCODE*AMOUNT*11-digit-number` or `SHORTCODE*AMOUNT
3. For Account transfers, the dialled string is of format `SHORTCODE*AMOUNT*10-digit-number`

# DECISIONS TAKEN FOR AIRTIME/ACCOUNT PURCHASES DIALLED STRING
I did notice that the data varies a lot, so I had to stick to the requirement. To get the airtime purchases,
I resorted to using the captured `short_code` that is already in the file.
