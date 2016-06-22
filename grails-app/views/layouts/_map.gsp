<asset:javascript src="jquery-2.2.0.min.js"/>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNHXCHKuHENb-qkrY_IgM3IAgT0cnILXs"
        type="text/javascript"></script>
<script>
    $(document).ready(function(){
        function initMap() {
            var myLatLng = {lat: ${clients[0].latitude}, lng: ${clients[0].longitude}};

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: myLatLng
            });

            var markers = [];
            <g:each var="client" in="${clients}" >
                markers.push(new google.maps.Marker({
                    position: {lat:${client.latitude}, lng:${client.longitude}},
                    map: map,
                    title: '${client.name}'
            }));
            </g:each>

        }
        initMap();
    });

</script>
<div id="map"></div>