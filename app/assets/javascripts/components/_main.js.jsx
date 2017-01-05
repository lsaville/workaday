var Main = React.createClass({
  render() {
    return (
      <div>
        <div>
          <Header />
        </div>
        <div>
          <Body map_key={this.props.map_key}/>
        </div>
      </div>
    )
  }
});
