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
          <Map lat={this.state.project.lat} lng={this.state.project.lng}/>
        </div>
        <div>
          <ProjectComments />
        </div>
      </div>
    )
  }
});
