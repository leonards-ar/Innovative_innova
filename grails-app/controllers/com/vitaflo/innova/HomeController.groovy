package com.vitaflo.innova

class HomeController {

    def index = {
        User.withTransaction{
            if(!session?.countries){
                def user = User.findByUsername(session.SPRING_SECURITY_LAST_USERNAME)
                session.countries = user.countries.sort{it.name}
            }
        }
    }
}
