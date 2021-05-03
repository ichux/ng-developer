# Q2.txt
The solution for the *Q2.txt* is contained within the *q2.sh* file.

# HOW TO RUN q2_v2.sh
Type:
`source q2_v2.sh notifications_q2/notifications.log`

Where *notifications_q2/notifications.log* is the name of the `path/file-name` that we intend to 
extract the logs from.

```
1. I decided to make it dynamic by not hard coding the file name. This will ensure that any file name can be passed to it
2. The latest version ensures that log file of any size can be read without impacting the PC's memory. q2.sh didn't work this way
3. Due to some terminal nuances, q2_v2.sh is more accurate than q2.sh
4. I have also added comments within the bash files to show how to reverse engineer the solution I gave.
```

# DECISIONS TAKEN
1. Within the *Q2.txt* file, there is an example of a notification given.
2. I decided to extract only that type of notification out of the log file and then process it to get 
the desired results.
3. I experimented with `cut`, `awk`, `sed`, `read` and `echo` within the bash script before finally settling with
the solution I am presenting. And it is done in `python`.
4. I have ensured that it is properly formatted so that it will not overflow into the screen and one would have
to scroll to the RHS (Right Hand Side) to see what the code contains!
   