import paho.mqtt.client as mqtt
from mqtt.mqtt import on_connect, on_message
from services.mqtt_service import insert_nodo

def create_mqtt_client():
    client = mqtt.Client()
    client.user_data_set(insert_nodo) # Usar ruta mqtt
    client.on_connect = on_connect
    client.on_message = on_message
    client.connect("3.88.102.79", 1883, 60)
    return client

if __name__ == '__main__':
    client = create_mqtt_client()
    client.loop_forever()