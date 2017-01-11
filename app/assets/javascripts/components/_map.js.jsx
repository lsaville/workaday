var Map = React.createClass({
  componentDidMount() {
    this.location = new google.maps.LatLng(this.props.lat, this.props.lng);
    this.map = this.createMap();
    this.marker = this.createMarker();
    new AutocompleteDirectionsHandler(this);
  },

  createMap: function() {
    var mapOptions = {
      mapTypeControl: false,
      zoom: 12,
      center: this.location
    };
    map = new google.maps.Map(this.refs.map_canvas, mapOptions);
    return map;
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
        <input id="origin-input" ref="origin_input" className="controls input-field" type="text" placeholder="Get Directions" />
        <div id={'map'} ref='map_canvas' className='z-depth-2'></div>
        <div id='right-panel' ref='map_panel' className='z-depth-2'></div>
      </div>
    )
  }
});
