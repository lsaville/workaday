function AutocompleteDirectionsHandler(mapComponent) {
  this.map = mapComponent.map;
  this.destination = mapComponent.location;
  this.originPlaceId;
  var originInput = mapComponent.refs.origin_input;
  this.directionsService = new google.maps.DirectionsService();
  this.directionsDisplay = new google.maps.DirectionsRenderer();
  this.mapPanel = mapComponent.refs.map_panel;
  this.directionsDisplay.setMap(this.map);
  this.directionsDisplay.setPanel(this.mapPanel);
  var originAutocomplete = new google.maps.places.Autocomplete(originInput, {placeIdOnly: true});
  this.setupPlaceChangedListener(originAutocomplete, "ORIG");
  this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
}

AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
  var me = this;
  autocomplete.bindTo('bounds', this.map);
  autocomplete.addListener('place_changed', function() {
    var place = autocomplete.getPlace();
    if (!place.place_id) {
      window.alert("Please select an option from the dropdown list.");
      return;
    }
    me.originPlaceId = place.place_id;
    me.route();
  });
}

AutocompleteDirectionsHandler.prototype.route = function() {
  if (!this.originPlaceId) {
    return;
  }
  var me = this;

  this.directionsService.route({
    origin: {'placeId': this.originPlaceId},
    destination: this.destination,
    travelMode: "DRIVING"
  }, function(response, status) {
    if (status === 'OK') {
      me.mapPanel.className = me.mapPanel.className.replace('no-collapse-hide','');
      me.directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}
