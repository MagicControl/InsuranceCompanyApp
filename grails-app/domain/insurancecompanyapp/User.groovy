package insurancecompanyapp

class User {
    String login
    String password
    String role = "user"

    static constraints = {
        login blank: false, unique: true, nullable: false
        password password: true, blank: false
        role inList: ["user", "admin"]
    }

    boolean isAdmin(){
        return role == "admin"
    }

    def beforeInsert(){
        password = password.encodeAsSHA1()
    }

    @Override
    public String toString() {
        login
    }
}
