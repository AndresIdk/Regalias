def on_connect(client, userdata, flags, rc):
    print("Connected to MQTT with result code "+str(rc))
    client.subscribe("semard/monitoring/data")

def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))
    data = userdata(msg.payload)
    # print(data) // Imprime el dato guardado en base de datos