class NoSePuedeSubiraLaExpedicionException inherits Exception{}

class Expedicion {
	var property vikingos
	var property objetivos
	//punto de entrada 1
	
	method subirAExpedicion(unVikingo){
		if(unVikingo.puedeSubirA(self))
			self.agregarAExpedicion(unVikingo)
		else
			 throw new NoSePuedeSubiraLaExpedicionException()
	
	}
	
	method agregarAExpedicion(unVikingo) {
		vikingos.add(unVikingo)
	}
	
	method cantidadDeVikingosEnLaExpedicion(){
		return vikingos.length()
	}
	
	//Punto de entrada 2
	method valeLaPenaExpedicion(){
		objetivos.all({objetivo => objetivo.valeLaPena(self)})
		
	}
	
	//Punto de entrada 3
	
	method realizarExpedicion(){
		objetivos.forEach(objetivo => objetivo.serInvadido())
	}
	
	method repartirBotin(botin){
		vikingos.forEach({vikingo => vikingo.ganar(botin/ self.cantidadDeVikingosEnLaExpedicion())})
	}
	
	
	method aumentarVidasCobradas(cantidad){
		vikingos.take(cantidad).forEach({vikingo => vikingo.cobrarVida()})
	}
}

class Capital {
	var property defensores 
	
	var property riquezaDelSuelo
	
	method valeLaPena(expedicion){
		return self.botinDeMonedasDeOro(expedicion)/3 >= expedicion.cantidadDeVikingosEnLaExpedicion()
	
	}
	
	
	method botinDeMonedasDeOro(unaExpedicion){
		
	   return self.defensorDerrotado(unaExpedicion) * riquezaDelSuelo
		   
	}
	
	method defensorDerrotado(unaExpedicion){
		return self.defensores().min(unaExpedicion.cantidadDeVikingosEnLaExpedicion())
	}
	
	method serInvadido(expedicion){
		expedicion.repartirBotin(self.botinDeMonedasDeOro(expedicion))
		self.destruirse(expedicion)
		
		
	}
	
	method destruirse(expedicion){
            defensores-= self.defensorDerrotado(expedicion)	
	}
	
	
	
}

class Aldea{
	var property defensores = 0
	var property crucificos
	
	method valeLaPena(unaExpedicion){
		return self.botinDeMonedasDeOro()>= 15
		
	}
	
	
	method botinDeMonedasDeOro(){
		return crucificos
	}
	
	method serInvadido(expedicion){
		expedicion.repartirBotin(self.botinDeMonedasDeOro())
	
		
	}
	
		
}

object aldeaAmurallada inherits Aldea{
	 
	 var property cantidadMininaVikingosEnLaComitiva
	 
	 override method valeLaPena(unaExpedicion){
	 	return super(unaExpedicion) and  self.cantidadMinimaDeVikingosEnLaComitiva(unaExpedicion)
	 	
	 }
	 
	 method cantidadMinimaDeVikingosEnLaComitiva(unaExpedicion){
	 	return unaExpedicion.cantidadDeVikingosEnLaExpedicion()>= cantidadMininaVikingosEnLaComitiva
	 }
}


