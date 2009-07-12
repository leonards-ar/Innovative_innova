class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
            lang = 'es'
	    constraints {
			 // apply constraints here
		  }
	  }
      "/"(controller:"home"){lang='es'}

      "500"(view:'/error')
    }
}
