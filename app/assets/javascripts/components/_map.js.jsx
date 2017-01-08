var Map = React.createClass({
  componentDidMount() {
    this.location = new google.maps.LatLng(this.props.lat, this.props.lng);
    this.map = this.createMap();
    this.marker = this.createMarker();
  },

  createMap: function() {
    var mapOptions = {
      zoom: 7,
      center: this.location
    }
    return new google.maps.Map(this.refs.map_canvas, mapOptions);
  },

  createMarker: function(){
    var markerOptions = {
      position: this.location,
      map: this.map
    }
    return new google.maps.Marker(markerOptions);
  },

  render(){
    return(
      <div>
        <div id={'map'} ref='map_canvas' className='z-depth-2'>I will be a map someday!</div>
      </div>
    )
  }
});
