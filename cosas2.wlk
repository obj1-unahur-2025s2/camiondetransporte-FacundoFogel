object knightRider {
    method peso() = 500

    method peligrosidad() {
        return 10
    }

    method bulto() = 1 

    method esPesoPar() = self.peso().even()

    method consecuenciasDeLaCarga() {}
}

object bumbleblee {
    var esAuto = true

    method peso() = 800

    method transformateEnAuto(){
        esAuto = true
    }

    
    method transformateEnRobot(){
        esAuto = false
    }

    method peligrosidad() = if(esAuto) 15 else 30

    method esPesoPar() = self.peso().even()

    method bulto() = 2

    method consecuenciasDeLaCarga() {
        self.transformateEnRobot()
    }
}

object ladrillos {
    var cantidad = 10

    method cantidad(nuevaCantidad) {
        cantidad = nuevaCantidad
    }

    method peso() = 2*cantidad

    method peligrosidad() = 2

    method esPesoPar() = self.peso().even()

    method bultos() {
        return
        if(cantidad <= 100){
            1
        }
        else if(cantidad.between(101, 300)){
            2
        }
        else{
            3
        }
    }

    method consecuenciasDeLaCarga() {
        cantidad = cantidad + 12
    }
}

object arena {
    var property peso = 0
    //crea el method de consulta peso y el setter peso
    method peligrosidad() = 1 

    method esPesoPar() = self.peso().even()

    method bulto() = 1

    method consecuenciasDeLaCarga() {
        peso = (peso - 10).max(0)
    }
}

object bateriaAntiaerea {
    var estaConMisiles = false

    method cargarMisiles() {
        estaConMisiles = true
    }

    method descargarMisiles() {
        estaConMisiles = false
    }

    method peso() = if(estaConMisiles) 300 else 200

    method peligrosidad() = if(estaConMisiles) 100 else 0 

    method esPesoPar() = self.peso().even()

    method bulto() = if(estaConMisiles) 2 else 1

    method consecuenciasDeLaCarga() {
        self.cargarMisiles()
    }
}

object contenedor {
    const cosasAdentro = []

    method agregar(unaCosa) {
        cosasAdentro.add(unaCosa)
    }

    method agregarVarias(variasCosas) {
        cosasAdentro.addAll(variasCosas)
    }

    method quitarCosa(unaCosa) {
        cosasAdentro.remove(unaCosa)
    }

    method peso() = 100 + cosasAdentro.sum({cosa => cosa.peso()})

    method peligrosidad(){
        return
            if(cosasAdentro.isEmpty()){
                0
            }
            else {
                cosasAdentro.max({cosa => cosa.peligrosidad()}).peligrosidad()
            }
    }
        
    method esPesoPar() = self.peso().even()

    method bulto() = 1 + cosasAdentro.sum({cosas => cosas.bulto()})

    method consecuenciasDeLaCarga() {
       if(not cosasAdentro.isEmpty())
            {cosasAdentro.forEach({cosas => cosas.consecuenciasDeLaCarga()})}
    }
}

object residuos {
    var property peso = 0

    method peligrosidad() = 200

    method esPesoPar() = self.peso().even()

    method bulto() = 1

    method consecuenciasDeLaCarga() {
        peso = peso + 15
    }
}

object embalaje {
    var cosaEnvuelta = arena

    method envolver(unaCosa) {
        cosaEnvuelta = unaCosa
    }
    
    method peso() = cosaEnvuelta.peso()

    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2

    method esPesoPar() = self.peso().even()
    
    method bulto() = 2

    method consecuenciasDeLaCarga() {}
}
