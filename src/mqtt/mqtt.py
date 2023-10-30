# import paho.mqtt.client as mqtt
# import sys
# sys.path.append('C:\\Users\\monit\\Desktop\\UDC\\Regalias\\src')
# import app

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    client.subscribe("SEMARD/#")

def on_message(client, userdata, msg, api):
    # app.post("/insert", json=msg.payload)
    print(msg.topic+" "+str(msg.payload))
