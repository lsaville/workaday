var ProjectBody = React.createClass({
  getInitialState() {
    return { project: null }
  },

  componentDidMount() {
    $.getJSON("/api/v1/projects/" + this.props.id, (response) => { this.setState({project: response})});
    if (this.state.project === null) return(<div><h1>loading...</h1></div>)
    return(
      <div>
        <div>
          <h1>{this.state.project.title}</h1>
        </div>
        <div>
          <ProjectComments />
        </div>
      </div>
    )
  }
});
