class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
            lang = 'es'
	    constraints {
			 // apply constraints here
		  }
	  }
      "/"(view:"/index"){lang='es'}

      "500"(view:'/error')
    }
}
