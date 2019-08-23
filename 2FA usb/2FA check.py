
pin = input('Enter your pin: ')
pin = int(pin)
import time
import calendar
import time
import datetime

##pin = input(' input your pin : ' )
pin = 398112

dt = datetime.datetime.now()
NZST = dt - datetime.timedelta(hours=0)
Final_time = (NZST - datetime.datetime(1970,1,1))
Final_time = Final_time.total_seconds()
Final_time = Final_time / 30
Final_time = round(Final_time)
Final_time = str(Final_time * pin)
Final_time = Final_time[8:]
print(Final_time)