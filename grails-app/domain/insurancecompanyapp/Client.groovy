package insurancecompanyapp

class Client {
    String name
    String email
    String street
    String zipcode
    String latitude
    String longitude

    static constraints = {
        name blank: false, nullable: false
        email email: true, unique: true
        street blank: false, nullable: false
        zipcode blank: false, nullable: false
        latitude blank: true, nullable: true
        longitude blank: true, nullable: true
    }

}
