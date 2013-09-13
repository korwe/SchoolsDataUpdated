class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		/*"/"(view:"/index")  */
        "/"(controller:'basicSchoolInformation', action:"/filter")
        "500"(view:'/error')

	}
}
