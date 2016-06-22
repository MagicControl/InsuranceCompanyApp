package insurancecompanyapp

class UserController {

    def users() {
        def users = User.findAllByRole("user")
        [users: users]
    }

    def newUser() {
        render view: "newUser"
    }

    def add(String login, String password) {
        def newUser = new User(login: login, password: password)
        newUser.save()
        redirect(action: "users")
    }

    def edit(Long id){
        def user = User.findById(id)
        [user:user]

    }

    def delete(Long id){
        def user = User.findById(id)
        user.delete()
        redirect(action: "users")
    }

    def applyChanges(Long id){
        def user = User.findById(id)
        if (user.role != "admin"){
            user.login = params.login
        }
        if (params?.password){
            user.password = params.password.encodeAsSHA1()
        }
        user.save()
        if (session.user.role == "user"){
            redirect(controller: "client", action: "clients")
        } else {
            redirect(action: "users")
        }

    }

    def changePassword(){
        def user = User.findById(session.user.id)
        [user: user]
    }

}
