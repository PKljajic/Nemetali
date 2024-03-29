pitanja <- function(lekcija, br_pitanja = 20, bodovanje = F, shuffle = T, repl = T, pos = F){
        
        #skra�uj u�itavanje (za nanosekundu)
        if (any(ls() %in% lekcija) != T){
                source(paste(lekcija, ".R", sep = "", collapse = ""))
                source(paste(lekcija, "_odgovor.R", sep = "", collapse = ""))
        }
        
        if(pos == T) {
                izbor <- as.numeric(readline("Koje pitanje i odgovor to�no �eli�? "))
                cat("\n", get(lekcija)[izbor])
                cat(paste("\nTo�an odgovor je:", get(paste(lekcija, "_odgovor", sep ="", collapse = ""))[izbor]),"\n")
                return()
        }
        
        #bug - vi�e pitanja od mogu�ih
        while(repl == F & br_pitanja > length(get(lekcija))) {
                repeat {
                        odg <- readline(paste("\nBroj pitanja koji se trebaju pokazati je ve�i od broja pitanja unutar lekcije.", 
                                              "�eli� li pro�i kroz sva pitanja unutar lekcije, ukucaj d,",
                                              "a ako �eli� promijeniti broj pitanja ukucaj n", sep = "\n"))
                        if (odg == "d"){
                                br_pitanja <- length(get(lekcija))
                                break
                        }
                        else if(odg == "n"){
                                br_pitanja <- as.numeric(readline("\nBroj pitanja: "))
                                break
                        }
                }
        }
        
        if (bodovanje == T) {
                assign("bodovi", 0, envir = globalenv())
        }
        
        #glavni dio
        if (shuffle == T){
                izbor <- sample(1:length(get(lekcija)), br_pitanja, replace = repl)
        } else if (shuffle == T & repl == T) {
                bk <- sample(1:(length(get(lekcija)) - br_pitanja), 1)
                izbor <- seq(bk, bk + br_pitanja, 1)
        } else {
                izbor <- 1:length(get(lekcija))
        }
        for (i in izbor) {
                cat(get(lekcija)[i])
                readline("\nTvoj odgovor -> ")
                cat(paste("\nTo�an odgovor je:", get(paste(lekcija, "_odgovor", sep ="", collapse = ""))[i]),"\n")
                if (bodovanje == T) {
                        repeat {
                                bod <- readline("\nDodijeliti bod? [d/n] ")
                                if (bod == "d"){
                                        bodovi <<- bodovi + 1
                                        cat("\n")
                                        break
                                }
                                else if (bod == "n"){
                                        cat("\n")
                                        readline("Napi�i ponovo odgovor: ")
                                        cat("\n")
                                        break
                                }
                        }
                } 
                else {
                        readline()
                }
        }
        
        #ispis bodova
        if (bodovanje == T){
                print (paste(bodovi, "/", br_pitanja, sep = ""))
        }
}