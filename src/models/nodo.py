class Nodo:
    def __init__(self, fecha = None, temp = None, ph = None, ec = None,
                od = None, tds = None, latitud = None, altitud = None):
        
        self.fecha = fecha
        self.temp = temp
        self.ph = ph
        self.ec = ec
        self.od = od
        self.tds = tds
        self.coordenadas = {"latitud": latitud, "altitud": altitud}
