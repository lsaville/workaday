var ProjectBody = React.createClass({
  getInitialState(){
    return {project: null}
  },

  componentDidMount() {
    $.getJSON("/api/v1/projects/" + this.props.id, (response) => { this.setState({ project: response})});
    debugger;
  },

  render() {
    return(
      <div>
        <div>
          <h1>project body once I learn about state</h1>
        </div>
        <div>
          <ProjectComments />
        </div>
      </div>
    )
  }
});
