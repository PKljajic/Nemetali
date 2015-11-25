# Nemetali

### Pitanja i odgovori za 1. kolokvij iz Tehnologije nemetalnih mineranih sirovina

Repo sadrži funkciju "pitanja" koja se nalazi u pitanje.R. Funkcija služi kao priprema za kolokvij tako da generira pitanje, čeka odgovor i izbacuje točan odgovor. Funkcija ne provjerava je li uneseni odgovor jednak točnom odgovoru, nego očekuje od korisnika da sam zaključi točnost odgovora i na takav način boduje.  

Inputi funkcije su: lekcija (unijeti naslov lekcije - "glina", "eruptivne", "pijesci" i "karbonati)  
                    br_pitanja (željeni broj pitanja; cijeli broj, po defaultu je 20)  
                    bodovanje (uključiti bodovanje ili ne [T ili F]; po defaultu je F)  
                    shuffle (random redoslijed pitanja; po defaultu je uključeno [T])  
                    repl (omogućiti ponavljanje istog pitanja; po defaultu je uključeno [T])  
                    pos (pogledati zasebno pitanje; po defaultu isključeno [F])  
                    
Primjer:  

          pitanja("eruptivne", 10, bodovanje = T, shuffle = T, repl = F)
          - postaviti će se 10 random pitanja iz poglavlja eruptivne stijene bez mogućnosti ponavljanja pitanja. Bodovanje je uključeno.
          
          pitanja("karbonati", pos = T)
          - pregled jednog određenog pitanja iz lekcije karbonati
