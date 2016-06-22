package insurancecompanyapp

import grails.converters.JSON
import grails.transaction.Transactional



@Transactional
class GeocodingService {
    def geoString = "https://maps.googleapis.com/maps/api/geocode/json?address="

    def getGeocodingData(Client client) {
        def url = new URL(geoString+URLEncoder.encode(client.street))
        def connection = url.openConnection()
        if (connection.responseCode == 200){
            def resp = connection.content.text
            def geodata = JSON.parse(resp)

            client.latitude = geodata.results.geometry.location.lat[0]
            client.longitude = geodata.results.geometry.location.lng[0]
        }
    }
}
