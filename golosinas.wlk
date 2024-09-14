object bombon {
    const property precio = 5
    var property peso = 15
    const property sabor = frutilla
    const property glutenfree = true

    method mordisco () {
        peso = (peso * 0.8) - 1
    }
}

object alfajor {
    const property precio = 12
    var property peso = 300
    const property sabor = chocolate
    const property glutenfree = false

    method mordisco () {
        peso = (peso * 0.8)
    }
}

object caramelo {
    const property precio = 1
    var property peso = 5
    const property sabor = frutilla
    const property glutenfree = true

    method mordisco () {
        peso = peso - 1
    }
}

object chupetin {
    const property precio = 2
    var property peso = 7
    const property sabor = naranja
    const property glutenfree = true

    method mordisco () {
        if (peso >= 2) {
            peso = (peso * 0.9)
        }        
    }
}

object oblea {
    const property precio = 5
    var property peso = 250
    const property sabor = vainilla
    const property glutenfree = false

    method mordisco () {
        if (peso > 70) {
            peso = (peso * 0.5)
        } else {
            peso = (peso * 0.75)
        }
    }
}

object chocolatin {
    var peso = 0
    const property glutenfree = false
    const property sabor = chocolate
    var property precio = 0

    method peso () = peso

    method peso (_peso) {
        peso =  _peso
        precio = _peso * 0.5
    }

    method mordisco () {
        peso = peso - 2
    }
}

object baniada {
    var property peso = 0
    var property sabor = naranja
    var property precio = 0
    var property glutenfree = true
    var property golosinaBaniada = bombon
    var property i = 0

    method baniar (_golosina) {
        golosinaBaniada = _golosina
        peso = _golosina.peso() + 4
        precio = _golosina.precio() + 2
        glutenfree = _golosina.glutenfree()
        sabor = _golosina.sabor()
        i = 0
    }

    method mordisco() {
        if (i < 2) {
            peso = peso - 2
            if(golosinaBaniada == pastilla){
                golosinaBaniada.mordisco()
                sabor = golosinaBaniada.sabor()
                }
        } else {
            golosinaBaniada.mordisco()
            peso = golosinaBaniada.peso()
            sabor = golosinaBaniada.sabor()
        }
        i = i + 1
    }
}

object pastilla {
    var property peso = 5
    var property glutenfree = true
    var property precio = 0
    const property sabores = [frutilla, chocolate, naranja]
    var property sabor = frutilla
    var property i = 0

    method precio () {
        if (glutenfree) {
            precio = 7
        } else {
            precio = 10
        }
        return precio
    }   

    method mordisco () {
        sabor = sabores.get(i)
        i = i+1
        if (i > 2) {
            i = 0
        }
        return sabor
    }
    
}

object frutilla {}

object chocolate {}

object naranja {}

object vainilla {}

object mariano {
    const property bolsa = []

    method comprar (_golosina) = bolsa.add(_golosina)

    method desechar (_golosina) = bolsa.remove(_golosina)

    method probarGolosina () = bolsa.forEach({n=> n.mordisco()})

    method hayGolosinaSinTACC () = bolsa.any({n=> n.glutenfree()})

    method preciosCuidados () = bolsa.all({n=> n.precio() <= 10})
    
    method golosinaDeSabor (_sabor) = bolsa.find({n=> n.sabor() == _sabor})
   
    method golosinasDeSabor (_sabor) = bolsa.filter({n=> n.sabor() == _sabor})

    //Hay que terminarlo
    method sabores () = bolsa.filter({n=> n.sabor()})

    method golosinaMasCara () = bolsa.max({n=> n.precio()})

    method pesoGolosinas () = bolsa.sum({n=> n.peso()})

}
