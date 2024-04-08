object loboFeroz {
    var tieneUnDisfraz = false
	var peso = 10
    var nroDeDientes = 42
    method disfrazarseDe(personaje){
        self.sacarseElDisfraz()
        personaje.sacarseElDisfraz()
        tieneUnDisfraz = true
    }
    method perderDientes(dientesPerdidos){
        nroDeDientes = 0.max(nroDeDientes - dientesPerdidos)
        self.bajarDePeso(nroDeDientes / 2)
    }
    method atacarAlCazador(cazador){
        cazador.perderHacha()
    }
    method sacarseElDisfraz(){
        tieneUnDisfraz = false
    }
	method estaSaludable(){
		return peso.between(20, 150)
	}
	method subirDePeso(pesoASubir){
		peso = peso + pesoASubir
	}
	method bajarDePeso(pesoABajar){
		peso = 0.max(peso - pesoABajar)
	}
	method sufrirCrisis(){
		peso = 10
	}
	method comerAAlguien(alguien){
		self.subirDePeso(alguien.peso() / 10)
	}
	method correrHastaAlgunLugar(){
		peso = 0.max(peso - 1)
	}
}

object caperucita{
    var tieneUnDisfraz = true
    var nroDeManzanas = 6
    method sacarseElDisfraz(){
        tieneUnDisfraz = false
    }
    method perderManzanas(nroManzanasPerdidas){
        nroDeManzanas = 0.max(nroDeManzanas - nroManzanasPerdidas)
    }
    method nroDeManzanas(){
        return nroDeManzanas
    }
    method peso(){
        return 60 + self.nroDeManzanas() * 0.2
    }
}

object abuelita{
    var tieneUnDisfraz = true
    method sacarseElDisfraz(){
        tieneUnDisfraz = false
    }
    method peso(){
        return 50
    }
}

object cazador{
    var peso = 120
    var tieneHacha = true
    var tieneUnDisfraz = true
    method sacarseElDisfraz(){
        tieneUnDisfraz = false
    }
    method atacarAlLobo(lobo, dientesQuePierdeElLobo){
        lobo.perderDientes(dientesQuePierdeElLobo)
    }
    method pesoDelHacha(){
        return 10
    }
    method bajarDePeso(pesoABajar){
		peso = 0.max(peso - pesoABajar)
	}
    method perderHacha(){
        tieneHacha = false
    }
    method agarrarElHacha(){
        tieneHacha = true
    }
    method peso(){
        return peso + if(tieneHacha) self.pesoDelHacha() else 0
    }
}
/**
El lobo va corriendo hasta el bosque.
loboFeroz.correrHastaAlgunLugar()
Allí se encuentra con Caperucita, conversan, pero no pasa nada más. Luego, el lobo corre a la casa de la abuelita
loboFeroz.correrHastaAlgunLugar()
y luego de comersela,
loboFeroz.comerAAlguien(abuelita)
se disfraza de ella.
loboFeroz.disfrazarseDe(abuelita)
Mientras tanto, Caperucita cruza el bosque y se le cae una manzana de su canasta.
caperucita.perderManzanas(1)
Cuando feroz ve llega a Caperucita a la casa, molesto por las preguntas incisivas sobre su aspecto físico, abre grande su boca y se come a Caperucita con canasta llena
loboFeroz.comerAAlguien(caperucita)
y todo. Finalmente, llega el cazador y ve a caperucita, sin saber que es el Lobo Feroz disfrazado de ella.
loboFeroz.disfrazarseDe(caperucita)
Confiado, deja su hacha sobre la mesa
cazador.perderHacha()
y se acerca a hablar con caperucita. Sin embargo, con la guardia baja, el lobo aprovecha a comerle el brazo (el brazo pesa una quinta parte de su peso corporal).
cazador.bajarDePeso(cazador.peso() / 5)
Asustado, el cazador agarra su hacha
cazador.agarrarElHacha()
y ataca al lobo, quitándole 14 dientes (a causa de esto, el lobo pierde 7 de peso).
cazador.atacarAlLobo(loboFeroz, 14)
Rápidamente, el lobo decide comerse al cazador con el hacha incluida, por lo que pierde 16 dientes
loboFeroz.comerAAlguien(cazador)
loboFeroz.perderDientes(16)
Finalmente, el lobo se disfraza del cazador y se prepara para su siguiente comida.
loboFeroz.disfrazarseDe(cazador)
* /
*/