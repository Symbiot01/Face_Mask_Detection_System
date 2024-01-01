import pyfirmata
import time
import random

board = pyfirmata.Arduino('COM16')

pin_12 = board.get_pin('d:12:o')
pin_9 = board.get_pin('d:9:s')


def mask_on():
    pin_12.write(1)
    pin_9.write(90)

def mask_off():
    pin_12.write(0)
    pin_9.write(0)

a = 0
while True:
    b = a
    a = random.choice([1,0])
    if (a==1 and b!=a):
        mask_on()
        print("on")
    elif (a==0 and b!=a):
        mask_off()
        print("off")
    time.sleep(1)
        


