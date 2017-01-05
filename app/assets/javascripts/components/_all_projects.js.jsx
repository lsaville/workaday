var AllProjects = React.createClass({
  getInitialState() {
    return { projects: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/projects', (response) => { this.setState({ projects: response }) });
  },

  render() {
    var projects = this.state.projects.map((project) => {
      return(
        <div key={project.id} className='project-card container z-depth-2'>
          <h3>{project.title}</h3>
          <p>lat: {project.lat}</p>
          <p>lng: {project.lng}</p>
          <div className='details'>{project.details}</div>
          <div id='map-small' className=''></div>
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
