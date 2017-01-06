var Map = React.createClass({
  componentDidMount() {
    this.map = this.createMap();
    this.marker = this.createMarker();
    this.location = new google.maps.LatLng(this.props.project.lat, this.props.project.lng);
  },

  createMap: function(){
    var mapOptions = {
      zoom: 7,
      center: this.location
    }
    new google.maps.Map(this.refs.map_canvas, mapOptions);
  },

  createMarker: function(){
    var markerOptions = {
      position: this.location,
      map: this.map
    }
    return new google.maps.Marker(markerOptions);
  },

  render(){
    var map_key = this.props.map_key;
    return(
      <div>
        <div id={"map-small_" + this.props.project.id} ref='map_canvas' className='right'></div>
        <script async defer src={"https://maps.googleapis.com/maps/api/js?key=" + map_key}></script>
      </div>
    )
  }
});
