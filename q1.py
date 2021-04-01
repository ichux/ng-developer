import csv
from datetime import datetime


class ExtractCSV(object):
    def __init__(self, extract_from, csv_result):
        """
        Extract all information based on description given into a csv file
        :param extract_from: input csv file
        :param csv_result: output csv file
        """
        self.extract_from = extract_from
        self.csv_result = csv_result
        self.code_sessions = {}
        self.airtime_purchases_dict = {}
        self.account_transfers_dict = {}
        self.airtime_purchases = 0
        self.account_transfers = 0

    def q1_1(self):
        """
        Contains the solution to Q1-1
        :return: None
        """
        with open(self.extract_from) as test_file, open(self.csv_result, 'w') as q1_file:
            csv_reader, csv_writer = csv.reader(test_file, delimiter=','), csv.writer(q1_file)

            for row in csv_reader:
                msisdn, session_id, session_start_time, session_end_time, short_code, dialled_string = row

                starts = datetime.strptime(session_start_time, "%Y%m%d%H%M%S")
                ends = datetime.strptime(session_end_time, "%Y%m%d%H%M%S")
                time_in_seconds = (ends - starts).seconds

                self.how_to_store(self.code_sessions, short_code, time_in_seconds)

                decide = dialled_string.startswith(f"{short_code}*")
                if decide:
                    ds = dialled_string.replace(f"{short_code}*", '').split('*')

                    if len(ds) == 2:
                        if len(ds[-1]) == 11:
                            self.airtime_purchases += 1
                            self.store_for_airtime_purchases(self.airtime_purchases_dict, short_code, time_in_seconds)
                        if len(ds[-1]) == 10:
                            self.account_transfers += 1
                            self.store_for_account_transfers_dict(self.account_transfers_dict, short_code,
                                                                  time_in_seconds)
                    else:
                        if len(ds) == 1:
                            self.airtime_purchases += 1
                            self.store_for_airtime_purchases(self.airtime_purchases_dict, short_code, time_in_seconds)

            # write the header for the output file
            csv_writer.writerow(["Short-code", "Number-of-sessions"])

            for key, value in self.code_sessions.items():
                # writing the fields
                csv_writer.writerow([key, (value + 19) // 20])

    def q1_2(self):
        """
        Contains the solution to Q2-2
        :return: None
        """
        print(f"\ntotal airtime purchases: {self.airtime_purchases}")
        print(f"total airtime purchases session: {sum(self.airtime_purchases_dict.values()) + 19 // 20}")

        print(f"\ntotal account transfers: {self.account_transfers}")
        print(f"total account transfers session: {sum(self.account_transfers_dict.values()) + 19 // 20}\n")

    @staticmethod
    def how_to_store(code_sessions, short_code, time_in_seconds):
        if short_code in code_sessions:
            code_sessions[short_code] += time_in_seconds
        else:
            code_sessions[short_code] = time_in_seconds

    @staticmethod
    def store_for_airtime_purchases(airtime_purchases_dict, short_code, time_in_seconds):
        if short_code in airtime_purchases_dict:
            airtime_purchases_dict[short_code] += time_in_seconds
        else:
            airtime_purchases_dict[short_code] = time_in_seconds

    @staticmethod
    def store_for_account_transfers_dict(account_transfers_dict, short_code, time_in_seconds):
        if short_code in account_transfers_dict:
            account_transfers_dict[short_code] += time_in_seconds
        else:
            account_transfers_dict[short_code] = time_in_seconds


if __name__ == '__main__':
    extract_csv = ExtractCSV('test_files_q1/test_files.csv', 'test_files_q1/Q1-1.csv')
    extract_csv.q1_1()
    extract_csv.q1_2()
