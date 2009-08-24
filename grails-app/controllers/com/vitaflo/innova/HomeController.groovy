package com.vitaflo.innova

class HomeController {

    def index = { 
        if(!session?.countries){
            print'\n @@@@@@@@@@@@@@@@@@@@@@otra vez sop@@@@@@@@@@@@@@@@@@@@@@@@@@\n'
            def user = User.findByUsername(session.SPRING_SECURITY_LAST_USERNAME)
            session.countries = user.countries
        }
        print session
    }
}
