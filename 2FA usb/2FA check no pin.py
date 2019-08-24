import time
import calendar
import time
import datetime
import hashlib


password = input('Enter your password here')

hash_of_pass = hashlib.md5(password.encode())
hash_of_pass = hash_of_pass.hexdigest()
num_hash = ''.join(x for x in hash_of_pass if x.isdigit())
print(num_hash)
pin = num_hash[:6]
pin = int(pin)
dt = datetime.datetime.now()
NZST = dt - datetime.timedelta(hours=0)
Final_time = (NZST - datetime.datetime(1970,1,1))
Final_time = Final_time.total_seconds()
Final_time = Final_time / 30
Final_time = round(Final_time)
Final_time = str(Final_time * pin)
Final_time = Final_time[8:]
print(Final_time)