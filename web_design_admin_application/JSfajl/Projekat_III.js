

class Clan
{
    id
    ime_prezime
    godiste
    email
    vrsta_clana
    clanarina

    constructor(id,ime_prezime,godiste,email,vrsta_clana,clanarina)
    {
        this.id = id
        this.ime_prezime = ime_prezime
        this.godiste = godiste
        this.email = email
        this.vrsta_clana = vrsta_clana
        this.clanarina = clanarina
    }
    static napravi_th(text){
        var novi_th = document.createElement('th');
        novi_th.innerText = text;
        return novi_th;
    }

}

//c1 = new Clan(1,"Matija Topalovic", 2002,"mtopalovic@gmail.com","regularan", 3000)
//c2 = new Clan(2,"Luka Topalovic",1998,"ltopalovic@gmail.com","povlasceni",2400)
//c3 = new Clan(3,"Nikola Ristic",2003,"nristic@gmail.com","povlasceni",2400)
//niz_clanova = [c1,c2,c3]

//localStorage.clear()

//localStorage.setItem('svi_clanovi',JSON.stringify(niz_clanova))

window.addEventListener('load',init)
var niz_clanova;
var tabela;
var dugme_dodavanje;
function init()
{
    
    tabela = document.getElementById('tabela')
    niz_clanova = JSON.parse(localStorage.getItem('svi_clanovi')) || []
    console.log(niz_clanova)
    var brojac = 0;

    for (const clan of niz_clanova)
    {
        var novi_red = document.createElement('tr')
        for (const key in clan) {
            if (Object.hasOwnProperty.call(clan, key)) {
                const element = clan[key];
                var novi_th = Clan.napravi_th(element)
                novi_red.appendChild(novi_th)
            }
        }
        //var id = Clan.napravi_th(clan.id)
        //novi_red.appendChild(id)
        //var brisanje = document.createElement('th')
        //brisanje.innerText = "Obrisi"
        
        var brisanje = Clan.napravi_th("Obrisi")
        brisanje.id = "brisanje_" + brojac;
        novi_red.appendChild(brisanje)
        

        var izmjena = Clan.napravi_th("Izmjeni")
        izmjena.id = "izmjena_" + brojac;
        novi_red.appendChild(izmjena)
        
        tabela.appendChild(novi_red)
        brisanje.addEventListener('click',obrisi_red)
        izmjena.addEventListener('click',prikaz_forme_za_izmjenu)
        brojac++;
    }
    dugme_dodavanje = document.getElementById('dodavanje')
    dugme_dodavanje.addEventListener('click',dodaj_clana)
}

function dodaj_clana(event)
{
    console.log("dodaj clana")
    event.preventDefault()

    var id_element = document.getElementById('id');
    var ime_element = document.getElementById('ime');
    var godiste_element = document.getElementById('godiste');
    var email_element = document.getElementById('email');
    var vrsta_element=document.querySelector('input[name="vrsta"]:checked')
    

    id = id_element.value
    ime = ime_element.value
    godiste = godiste_element.value
    email = email_element.value
    vrsta = vrsta_element.value
    clanarina = 3000
    if(vrsta == "povlasceni")
    {
       clanarina = clanarina*0.8
    }
    

    if(id == "" || ime == "" || godiste == "" || email == "" )
    {
        window.alert("neispravan unos podataka!")
        return;
    }
    console.log(id)
    if (validacija_id(id) == true)
    {
        alert(`ID: ${id} JE VEC ZAUZET PROBAJ OPET`)
        return;
    }
    if(validacija_imena(ime) == false)
    {
        alert(`Ime mora imati 2 rijeci!`)
        return; 
    }
    if(validacija_mejla(email) == false)
    {
        alert(`email mora sadrzati "@"`)
        return;
    }
    if(godiste < 0 || godiste > 2023)
    {
        alert(`godiste ne smije biti negativno ili vece od trenutne godine!`)
        return;
    }
    
    var c = new Clan(id,ime,godiste,email,vrsta,clanarina)
    var svi_clanovi = JSON.parse(localStorage.getItem('svi_clanovi')) || [];
    svi_clanovi.push(c);
    localStorage.setItem('svi_clanovi',JSON.stringify(svi_clanovi))
    location.reload()
    
}



function validacija_id(id)
{
    var svi_clanovi = JSON.parse(localStorage.getItem('svi_clanovi')) || [];
    for (const clan of svi_clanovi){
        if(clan.id == id){
            return true;
        }
    }
    return false;
}
function validacija_imena(ime_prezime)
{
    if (ime_prezime.match (/\S+/g).length < 2) return false
        {
            return true;
        }
}
function validacija_mejla(email)
{
    if(email.includes('@')) return true;
    return false;
}

function obrisi_red(event){
    var meta = event.target;
    var id_mete = meta.id;
    var djelovi_id_mete = meta.id.split("_")
    var pozicija =  parseInt(djelovi_id_mete[1]);
    var svi_clanovi = JSON.parse(localStorage.getItem('svi_clanovi'))
    svi_clanovi.splice(pozicija,1)
    localStorage.setItem('svi_clanovi', JSON.stringify(svi_clanovi))
    location.reload()
}
function prikaz_forme_za_izmjenu(event){

    pozicija = parseInt(event.target.id.split("_")[1]) 
    var prostor_izmjena = document.getElementById('izmjena')
    var svi_clanovi = JSON.parse(localStorage.getItem('svi_clanovi'))
    var trenutni = svi_clanovi[pozicija]
    
    var regularni, povlasceni
    if(trenutni.vrsta_clana == "povlasceni") 
    {
        povlasceni="checked"
    } 
    else
    {
        regularni="checked"
    }
    prostor_izmjena.innerHTML = `
    <form action="">
        <h3>IZMJENITI CLANA</h3>
        <p>
            <label for="id">ID:</label>
            <input type="number" name="id" id="id_izmjena" value=${trenutni.id} readonly>
        </p>
        <p>
            <label for="ime">Ime i prezime:</label>
            <input type="text" name="ime" id="ime_izmjena" value='${trenutni.ime_prezime}'>
        </p>
        <p>
            <label for="godiste">Godina rodjenja:</label>
            <input type="number" name="godiste" id="godiste_izmjena" value=${trenutni.godiste}>
        </p>
        <p>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email_izmjena" value=${trenutni.email}>
        </p>
        <p>
            <label for="vrsta" id="vrsta_izmjena">Vrsta:</label>
            <label>Regularni</label>
            <input type="radio" name="vrsta" value="regularni" ${regularni}>
            <label>Povlasceni</label>
            <input type="radio" name="vrsta" value="povlasceni"  ${povlasceni}>
        </p>
        
        <button id="izmjena_clana">Izmjena</button>
    </form>`
    var dugme_izmjena = document.getElementById('izmjena_clana')
    dugme_izmjena.addEventListener('click',izmjena_clana)
}

function izmjena_clana(event){

    event.preventDefault()

    var id_element = document.getElementById('id_izmjena');
    var ime_element = document.getElementById('ime_izmjena');
    var godiste_element = document.getElementById('godiste_izmjena');
    var email_element = document.getElementById('email_izmjena');
    var vrsta_element=document.querySelector('input[name="vrsta"]:checked')

    id = id_element.value
    ime = ime_element.value
    godiste = godiste_element.value
    email = email_element.value
    vrsta = vrsta_element.value
    clanarina = 3000
    if(vrsta == "povlasceni")
    {
       clanarina = clanarina*0.8
    }
    if(id == "" || ime == "" || godiste == "" || email == "" )
    {
        window.alert("neispravan unos podataka!")
        return;
    }
    if(validacija_imena(ime) == false)
    {
        alert(`Ime mora imati 2 rijeci!`)
        return; 
    }
    if(validacija_mejla(email) == false)
    {
        alert(`email mora sadrzati "@"`)
        return;
    }
    if(godiste < 0 || godiste > 2023)
    {
        alert(`godiste ne smije biti negativno ili vece od trenutne godine!`)
        return;
    }

    var c = new Clan(id,ime,godiste,email,vrsta,clanarina)
    var svi_clanovi = JSON.parse(localStorage.getItem('svi_clanovi')) || []

    var n = svi_clanovi.length;
    for (var i = 0; i<n;i++)
    {
        if(svi_clanovi[i].id == id)
        {
            svi_clanovi[i] = c;
            break
        }
    }
    localStorage.setItem('svi_clanovi', JSON.stringify(svi_clanovi))
    location.reload();

}


