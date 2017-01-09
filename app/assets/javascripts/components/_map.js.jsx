var Map = React.createClass({
  componentDidMount() {
    this.location = new google.maps.LatLng(this.props.lat, this.props.lng);
    this.louvre = new google.maps.LatLng(48.8596, 2.3369);
    this.directionsService = new google.maps.DirectionsService();
    this.directionsDisplay = new google.maps.DirectionsRenderer();
    this.map = this.createMap();
    this.marker = this.createMarker();
    this.directions = this.createDirections();
  },

  createMap: function() {
    var mapOptions = {
      zoom: 12,
      center: this.location
    };
    map = new google.maps.Map(this.refs.map_canvas, mapOptions);
    this.directionsDisplay.setMap(map);
    this.directionsDisplay.setPanel(this.refs.map_panel);
    return map;
  },

  createMarker: function(){
    var markerOptions = {
      position: this.location,
      map: this.map
    }
    return new google.maps.Marker(markerOptions);
  },

  createDirections: function() {
    var request = {
      origin: this.location,
      destination: this.louvre,
      travelMode: google.maps.TravelMode['DRIVING']
    };
    this.directionsService.route(request, (response, status) => {
      if(status == 'OK') {
        this.directionsDisplay.setDirections(response);
      }
    });
  },

  render(){
    return(
      <div>
        <div id={'map'} ref='map_canvas' className='z-depth-2'>I will be a map someday!</div>
        <div id='right-panel' ref='map_panel' className='z-depth-2'></div>
      </div>
    )
  }
});
