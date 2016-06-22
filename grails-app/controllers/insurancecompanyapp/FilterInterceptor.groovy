package insurancecompanyapp


class FilterInterceptor {

    public FilterInterceptor(){
        matchAll().excludes(controller: "login")
    }

    boolean before() {
        if (!session.user){
            redirect controller: "login", action: "login"
        }
        return true
    }
}
