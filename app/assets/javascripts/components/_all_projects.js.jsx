var AllProjects = React.createClass({
  getInitialState() {
    return { projects: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/projects', (response) => { this.setState({ projects: response }) });
  },

  render() {
    var map = function initMap(project){
      var location = {lat: project.lat, lng: project.lng} 
      var map = new google.maps.Map(document.getElementById('map'), {zoom: 12, center: location});
      var marker = new google.maps.Marker({
        position: location,
        map: map
      });
    };
    var map_key = this.props.map_key;
    var projects = this.state.projects.map((project) => {
      return(
        <div key={project.id} className='project-card container z-depth-2'>
          <div className='card-content left'>
            <h3>{project.title}</h3>
            <p>lat: {project.lat}</p>
            <p>lng: {project.lng}</p>
            <div className='details'>{project.details}</div>
          </div>
          <div id='map-small' className='right'></div>
          <script>
            var map = function initMap(project){
              var location = {lat: project.lat, lng: project.lng} 
              var map = new google.maps.Map(document.getElementById('map'), {zoom: 12, center: location});
              var marker = new google.maps.Marker({
                position: location,
                map: map
              });
            };
          </script>
          <script async defer src={"https://maps.googleapis.com/maps/api/js?key=" + map_key + "&callback=initMap"}></script>
        </div>
      )
    }); 

    return(
      <div>
        {projects}
      </div>
    )
  }
});
