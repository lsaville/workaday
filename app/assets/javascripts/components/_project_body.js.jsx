var ProjectBody = React.createClass({
  getInitialState() {
    return { project: null }
  },

  componentDidMount() {
    $.getJSON("/api/v1/projects/" + this.props.id, (response) => { this.setState({project: response})});
  },

  render() {
    if (this.state.project === null) return(<div><h1>loading...</h1></div>)
    return(
      <div>
        <div className="container project">
          <h1>{this.state.project.title}</h1>
          <p>{this.state.project.details}</p>
          <Map lat={this.state.project.lat} lng={this.state.project.lng}/>
          <a href="#" className="project-btn waves-effect waves-light btn z-depth-2">Edit</a>
          <a href="#" className="project-btn waves-effect waves-light btn z-depth-2">Delete</a>
        </div>
        <div>
          <ProjectComments />
        </div>
      </div>
    )
  }
});
