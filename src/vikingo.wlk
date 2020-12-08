class Vikingo {
	var property castaSocial
	var property botin

	
   method puedeSubirA(expedicion){
   	return self.esProductivo() && castaSocial.puedeIr(self, expedicion)
   }
  		
   method esProductivo()
   
   //punto de entrada 5
   method asciendeEscalaSocial(){
   	      return castaSocial.puedeAscender(self)
   	      
   }
   
   method bonificarAscenso()
   
   method ganar(unasMonedas){
   	botin+= unasMonedas
   	
   }
   
   method cobrarVida()
       
   
 }



class granjero inherits Vikingo {
	var property cantidadHijos
	var property hectariasAsignadas
	
	override method esProductivo(){
		return self.tieneMinimoDosHectareasPorHijo()
		
	}
	
	method tieneMinimoDosHectareasPorHijo(){
		return self.hectariasAsignadas()/2>= self.cantidadHijos()
	}
	
   method tieneArmas()= false
   

   override method bonificarAscenso(){
   	cantidadHijos+=2
   	hectariasAsignadas+=2
   	
   }
	
	
}

class soldado inherits Vikingo{
	var property armas
	var property vidasCobradas
	
	override method esProductivo(){
		return self.tieneArmas() && vidasCobradas > 20

	}
	
	method tieneArmas() = armas > 0
	
	method cobrarVida(){
		vidasCobradas+=1
	}
	
	
   
   override method bonificarAscenso(){
   	    armas+=10
   }
	
	
	
}

class CastaSocial{
	method puedeIr(unVikingo, unaExpedicion)= true

	
	
}


object esclavo inherits CastaSocial{
	
	
	override method puedeIr(unVikingo, unaExpedicion){
		return !unVikingo.tieneArmas()
		
	}
	
	method puedeAscender(unVikingo){
		unVikingo.castaSocial(media)
		unVikingo.bonificarAscenso()
		
	}
	
	
	
	
}

object media inherits CastaSocial{
	
	method puedeAscender(unVikingo){
		unVikingo.castaSocial(noble)
		
	}
	

	
	
	
}

object noble inherits CastaSocial{
	
   method puedeAscender(unVikingo){
		
	}
	

}