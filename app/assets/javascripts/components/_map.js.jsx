var Map = React.createClass({
  componentDidMount() {
    this.map = this.createMap();
    this.marker = this.createMarker();
  },

  location: {
    lat: this.props.project.lat,
    lng: this.props.project.lng
  },

  createMap: function(){
    var mapOptions = {
      zoom: 12,
      center: location
    }
    return new google.maps.Map(this.refs.map_canvas.getDOMNode(), mapOptions);
  },

  createMarker: function(){
    var markerOptions = {
      position: location,
      map: this.map
    }
  },

  render(){
//    function initMap() {
//      var location = {lat: this.props.project.lat, lng: this.props.project.lng};
//      var map = new google.maps.Map(document.getElementById('map-small_' + this.project.id), {
 //       zoom: 12,
//        center: location
//      });
//      var marker = new google.maps.Marker({
//        position: location,
//        map: map
//      });
//    }
    var map_key = this.props.map_key;
    return(
      <div>
        <div id={"map-small_" + this.props.project.id} refs='map_canvas' className='right'>I will be a map someday</div>
        <script async defer src={"https://maps.googleapis.com/maps/api/js?key=" + map_key + "&callback=initMap"}></script>
      </div>
    )
  }
});
