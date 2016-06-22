import grails.util.GrailsUtil
import insurancecompanyapp.User

class BootStrap {

    def init = { servletContext ->
        def admin = new User(login: "admin", password: "admin", role: "admin")
        admin.save()
        def user = new User(login: "user", password: "user", role:"user")
        user.save()
    }
    def destroy = {
    }
}
