
from genericpath import isfile


class Slusalice:
    __naziv_modela : str 
    __cena : float 

    def __init__(self,naziv_modela,cena):
        self.__naziv_modela = naziv_modela
        self.__cena = cena 
    
    def get_naziv_modela(self):
        return self.__naziv_modela
    
    def get_cena(self):
        return self.__cena
    
    def set_naziv_modela(self,novi_naziv_modela):
        if len(novi_naziv_modela) < 3:
            print("Naziv mora da ima bar 3 karaktera!")
            return
        self.__naziv_modela = novi_naziv_modela

    def set_cena(self,nova_cena):
        if nova_cena < 0:
            print("Cena ne sme da bude - !")
            return 
        self.__cena = nova_cena
    
    def pretvori_u_csv(self):
        self.__naziv_modela = self.__naziv_modela.replace(","," ")
        return f"{self.__naziv_modela}, {self.__cena}\n"
    
    @staticmethod
    def cena_opadajuce(lista_slusalica):
        najskuplje = lista_slusalica[0]
        cena_najskupljih = lista_slusalica[0].get_cena()
        for slusalice in lista_slusalica:
            cena_trenutnih = slusalice.get_cena()
            if cena_trenutnih > cena_najskupljih:
                cena_najskupljih = cena_trenutnih
                najskuplje = slusalice
        return najskuplje
        filtirano_po_ceni = [] 
        for trenutne_slusalice in lista_slusalica: 
            cena_trenutnih = trenutne_slusalice.get_cena()  
            if cena_trenutnih < cena_najskupljih: 
                filtirano_po_ceni.append(trenutne_slusalice) 
        return filtirano_po_ceni


    @classmethod
    def napravi_slusalice_od_reda(cls, red):
        delovi_reda = red.split(',')
        naziv = delovi_reda[0].strip()
        cena = float(delovi_reda[1].strip())
        return cls(naziv, cena)
    
    @staticmethod
    def ucitaj_iz_fajla(naziv_fajla):
        if not isfile(naziv_fajla):
            print("Fajl ne postoji!")
            return 
        f = open(naziv_fajla,"r")
        lista_slusalica = [] 
        f.readline() 
        while True:
            trenutni_red = f.readline()
            if trenutni_red == "": 
                break 
            trenutne_slusalice = Slusalice.napravi_slusalice_od_reda(trenutni_red)
            lista_slusalica.append(trenutne_slusalice)
        f.close()
        return lista_slusalica

    def __str__(self) -> str:
        rez = "*" * 100 + "\n"
        rez += f"Naziv modela: {self.__naziv_modela}\n"
        rez += f"Cena: {self.__cena:.2f}\n"
        rez += "*" * 100 + "\n\n"
        return rez
    
    @staticmethod
    def stampaj_listu_slusalica(lista_slusalica):
        brojac = 1
        for slusalice in lista_slusalica:
            print(f"{brojac})")
            print(slusalice)
            brojac += 1
    
def main():
    #s1 = Slusalice(naziv_modela, cena)
    sve_slusalice = Slusalice.ucitaj_iz_fajla("izlaz.txt")
    Slusalice.stampaj_listu_slusalica(sve_slusalice)
    print('-' * 100)
    opadajuca_cena = Slusalice.cena_opadajuce(sve_slusalice)
    print(opadajuca_cena)

if __name__ == "__main__":
    main()