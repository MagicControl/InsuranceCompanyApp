package insurancecompanyapp

class LoginController {

    def login(){}

    def authenticate(String login, String password) {
        def user = User.findByLoginAndPassword(login, password.encodeAsSHA1())
        if (user) {
            session["user"] = user
            redirect controller: "Client", action: "clients"
        } else {
            flash.message = "Wrong login/password"
            redirect controller: "login", action: "login"
        }
    }

    def logout() {
        session.setAttribute("user",null)
        if (session.user){
            println session.user.login
        }
        redirect action: "login"
    }
}
