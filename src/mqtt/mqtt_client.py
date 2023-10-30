import paho.mqtt.client as mqtt
from mqtt.mqtt import on_connect, on_message

def create_mqtt_client(mqtt_api):
    client = mqtt.Client(userdata=mqtt_api)
    # client.user_data_set(mqtt_api) # Usar ruta mqtt
    client.on_connect = on_connect
    client.on_message = on_message
    client.connect("test.mosquitto.org", 1883, 60)
    return client

if __name__ == '__main__':
    client = create_mqtt_client()
    client.loop_forever()