package insurancecompanyapp

import au.com.bytecode.opencsv.CSVParser
import org.springframework.web.multipart.MultipartFile


class ClientController {
    GeocodingService geocodingService


    def clients() {
        def clients = Client.findAll()
        [clients: clients]
    }

    def clientManager() {
        render view: "load"
    }

    def loadCsvUserData() {
        MultipartFile file = params.csvFile;
        def stringArray = file.getOriginalFilename().split("\\.")
        String fileFormat = stringArray[stringArray.length - 1]
        if (fileFormat != "csv") {
            response.setStatus(400)
            return response
        }
        InputStream inputStream = file.inputStream;
        Integer clientsCount = 0;
        CSVParser parser = new CSVParser()
        inputStream.eachLine {
            def data = parser.parseLine(it)
            if (!Client.findByEmail(data[1])) {
                def client = new Client(
                        name: data[0],
                        email: data[1],
                        street: data[2],
                        zipcode: data[3]
                )
                geocodingService.getGeocodingData(client)
                client.save()
                clientsCount++;
            }
        }
        response << clientsCount;
    }

    def edit(Long id) {
        def client = Client.findById(id)
        [client: client]
    }

    def applyChanges(Long id) {
        def client = Client.findById(id)
        client.name = params.name
        client.email = params.email
        if (client.street != params.street) {
            client.street = params.street
            geocodingService.getGeocodingData(client)
        }
        client.zipcode = params.zipcode
        client.save()
        redirect(action: "clients")
    }

    def delete(Long id) {
        def client = Client.findById(id)
        client.delete()
        redirect(action: "clients")
    }

    def search() {
        def result = Client.findAll("from Client as c where c.name LIKE :query " +
                "or c.email LIKE :query " +
                "or c.street LIKE :query " +
                "or c.zipcode LIKE :query", [query: "%${params.query}%"])
        [clients: result]
    }

    def load() {}
}
