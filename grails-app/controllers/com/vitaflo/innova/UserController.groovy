package com.vitaflo.innova

class UserController {

    def login = { LoginCommand cmd ->
        if(request.method == 'POST') {
            if(!cmd.hasErrors()) {
                session.user = cmd.getUser()
                redirect(controller:'home')
            }
            else {
                render(view:'/home/index', model:[loginCmd:cmd])
            }
        }
        else {
            render(view:'/home/index')
        }
    }

    def logout = {
            session.invalidate()
            redirect(controller:"home")
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [update: "POST"]

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            redirect(action: "logout")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save()) {
                flash.message = "user.updated"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} updated"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            redirect(action: "logout")
        }
    }

}

class LoginCommand {
    String username
    String password
    private userToLogin

    User getUser() {
        if(!userToLogin && username)
            userToLogin = User.findByUsername(username)

        return userToLogin
    }

    static constraints = {
        username(blank:false, validator:{ val, cmd ->
            if(!cmd.user)
                return "user.not.found"
        })

        password (blank:false, validator:{ val, cmd ->
            if(cmd.user && cmd.user.password != val)
                return "user.password.invalid"
        })
    }
}