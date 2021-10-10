from sense_hat import SenseHat
from time import sleep

sense = SenseHat()

sense.set_rotation(270)
sense.clear()

red = (255,0,0)
green = (0,255,0)
blue = (0,0,255)



def temperature():
    temp = sense.get_temperature()
    print(temp)
    if temp > 34:
        sense.clear(red)
    elif temp < 34 and temp > 24:
        sense.clear(green)
    elif temp < 24 and temp > 0:
        sense.clear(blue)
    sleep(1)

    sense.show_message(str(round(temp,2)))



def humidity():
    humidity = sense.get_humidity()
    print(humidity)
    if humidity > 40:
        sense.clear(blue)
    elif humidity < 40 and humidity > 30:
        sense.clear(green)
    elif humidity < 30 and humidity > 0:
        sense.clear(red)
    sleep(1)
    
    sense.show_message(str(round(humidity,2)))


try:
    while True:
        for event in sense.stick.get_events():
            if event.action == "pressed":
                if event.direction =="up":
                    temperature()
                elif event.direction == "down":
                    humidity()
                sleep(0.5)


except KeyboardInterrupt:
    sense.show_message("Bye!")
