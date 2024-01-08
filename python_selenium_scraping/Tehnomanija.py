
from selenium import webdriver 
from time import sleep 
from selenium.webdriver.common.by import By
from os.path import isfile
from Slusalice import Slusalice

class Tehnomanija:

    __driver : webdriver.Chrome  

    def __init__(self, putanja_do_drivera = "chromedriver.exe"): 
        if not isfile(putanja_do_drivera):
            print("Losa putanja do drivera!") 
            raise FileNotFoundError("Greska, fajl ne postoji!") 
        self.__driver = webdriver.Chrome(putanja_do_drivera) 
    
    def poseti_stranicu(self, putanja_do_stranice):
        try:
            self.__driver.get(putanja_do_stranice)
        except:
            pass 

    def dohvati_elemente(self,pretraga_id="",pretraga_klasa="",pretraga_tag="",pretraga_name="",pretraga_link="",pretraga_partial = "",pretraga_css=""):
        self.__driver.implicitly_wait(10)
        if len(pretraga_id) != 0:
            try:
                rez = self.__driver.find_element(By.ID, pretraga_id) 
                return rez  
            except:
                return None 
            
        if len(pretraga_klasa) != 0:
            try:
                rez = self.__driver.find_elements(By.CLASS_NAME, pretraga_klasa)
                return rez 
            except:
                return [] 

        if len(pretraga_tag) != 0:
            try:
                rez = self.__driver.find_elements(By.TAG_NAME, pretraga_tag)
                return rez 
            except:
                return [] 
        
        if len(pretraga_name) != 0:
            try:
                rez = self.__driver.find_elements(By.NAME, pretraga_name)
                return rez 
            except:
                return [] 
        
        if len(pretraga_link) != 0:
            try:
                rez = self.__driver.find_elements(By.LINK_TEXT, pretraga_link)
                return rez 
            except:
                return []
            
        if len(pretraga_partial) != 0:
            try:
                rez = self.__driver.find_elements(By.PARTIAL_LINK_TEXT, pretraga_partial)
                return rez 
            except:
                return []
        
        if len(pretraga_css) != 0:
            try:
                rez = self.__driver.find_elements(By.CSS_SELECTOR,pretraga_css)
                return rez 
            except:
                return []


    def zatvori_sve(self):
        self.__driver.quit()

    def zatvori_prozor(self):
        self.__driver.close()
    
    def implicitno_sacekaj(self,broj_sekundi = 10):
        self.__driver.implicitly_wait(broj_sekundi)
    
    def odspavaj(self,broj_sekundi = 10):
        sleep(broj_sekundi)
    
    def idi_nazad(self):
        self.__driver.back()
    
    def dohvati_info(self):
        rez = self.dohvati_elemente(pretraga_css=".pdp-header--product-name h1")
        naslov = rez[0]  
        naslov = naslov.text 
        cena = self.dohvati_elemente(pretraga_klasa="product-price-newprice")
        tekst_cene = cena.text
        delovi_cene = tekst_cene.split(" RSD")
        cena = delovi_cene[0]
        cena = cena.replace(".","") 
        cena = cena.replace(",",".") 
        cena = float(cena)
        trenutne_slusalice = Slusalice(naslov,cena )
        return trenutne_slusalice
        
    def get_driver(self):
        return self.__driver
    
    def set_driver(self, novi_driver:webdriver.Chrome):
        if not isinstance(novi_driver,webdriver.Chrome):
            print("Pogresan tip podatka je poslat")
            return 
        self.__driver = novi_driver

    @staticmethod
    def napravi_listu_putanja(pocetna_putanja="https://www.tehnomanija.rs/c/televizori-audio-i-video/slusalice-zvucnici-i-audio/slusalice-10020108"):
        lista_putanja = []
        lista_putanja.append(pocetna_putanja)
        for i in range(1,6):
            nova_putanja = pocetna_putanja + f"?currentPage={i}"
            lista_putanja.append(nova_putanja)
        return lista_putanja

    def obidji_sve_stranice(self,pretraga_klasa, naziv_fajla="izlaz.txt"):
        f = open(naziv_fajla,"w")
        f.write("Naziv modela, Cena\n")
        f.close() 
        lista_putanja = Tehnomanija.napravi_listu_putanja()
        for putanja in lista_putanja:
            self.obidji_linkove_strane(putanja)

    def obidji_linkove_strane(self, putanja_do_stranice):
        try:
            self.__driver.get(putanja_do_stranice)
            rez = self.dohvati_elemente(pretraga_klasa="product-carousel--href")
            n = len(rez) 
            for i in range(n):
                self.odspavaj(5)
                element = (rez[i].get_attribute("href"))  
                self.poseti_stranicu(element)
                trenutne_slusalice = self.dohvati_info()
                ubacujem_podatke = trenutne_slusalice.pretvori_u_csv()
                self.sacuvaj_u_fajl(naziv_fajla,podaci_koje_ubacujem) 
                self.odspavaj(5)
                self.idi_nazad()
                rez = self.dohvati_elemente(pretraga_klasa="product-carousel--href")
        except:
            pass 

    def sacuvaj_u_fajl(self,naziv_fajla,podaci_koje_ubacujem):
        f = open(naziv_fajla,"a") 
        f.write(podaci_koje_ubacujem)
        f.close() 





def main():
    t1 = Tehnomanija()

    t1.poseti_stranicu("https://www.tehnomanija.rs/c/televizori-audio-i-video/slusalice-zvucnici-i-audio/slusalice-10020108")
    # #help(t1.dohvati_elemente)
    rez = t1.dohvati_elemente("","","p") # da ja ne bih svaki put, morao da popunjavam sve ove prethodne vrednosti sa "" kako bi te pretrage bile ignorisane 
    # # mi mozemo da iskoristimo nesto sto se naziva "KLJUCNI atribut" prilikom poziva same metode 
    #rez = t1.dohvati_elemente(pretraga_tag="p")
    #print(len(rez))
    rez = t1.dohvati_elemente(pretraga_klasa="product-carousel--href")
    # print(rez.text)
    t1.implicitno_sacekaj()
    # t1.sacekaj_vreme(5)
    #t1.obidji_sve_stranice(pretraga_klasa="product-carousel--href",naziv_fajla="izlaz.txt")
    t1.zatvori_prozor()

if __name__ == "__main__":
    main()
