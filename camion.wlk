import cosas.*

object camion {
    const carga = []

    method cargar(unaCosa) {
        carga.add(unaCosa)    
    }

    method descargar(unaCosa) {
        carga.remove(unaCosa)
    }

    method pesoTotal() = 1000 + carga.sum({cosa => cosa.peso()})

    method todoPesoPar() = carga.all({cosa => cosa.esPesoPar()})

    method algunaCosaPesa(unPeso){
        return carga.any({cosa => cosa.peso() == unPeso})
    }

    method primerCosaConPeligrosidad(unaPeligrosidad) {
        return carga.find({cosa => cosa.peligrosidad() == unaPeligrosidad})
    }

    method todasLasCosasConMasPeligrosidadQue(unaPeligrosidad) {
        return carga.filter({cosa => cosa.peligrosidad() > unaPeligrosidad})
    }

    method cosasQueSuperanPeligrosidadDe(unaCosa) {
        return carga.filter({cosa => cosa.peligrosidad() > unaCosa.peligrosidad()})
    }

    method pesoExcedido() {
        return self.pesoTotal() > 2500
    }

    method puedeCircular() {
      
    }
}