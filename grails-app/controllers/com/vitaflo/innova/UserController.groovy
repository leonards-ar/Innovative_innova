package com.vitaflo.innova

class UserController {
    def authenticateService

   // the delete, save and update actions only accept POST requests
    static allowedMethods = [update: "POST"]

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "list")
            return
        }

        List roleNames = []
		for (role in userInstance.authorities) {
			roleNames << role.authority
		}
		roleNames.sort { n1, n2 ->
			n1 <=> n2
		}
        return [userInstance: userInstance, roleNames: roleNames]
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            redirect(controller: "logout")
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
            userInstance.passwd = authenticateService.encodePassword(params.passwd)
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
            redirect(controller: "logout")
        }
    }

}
