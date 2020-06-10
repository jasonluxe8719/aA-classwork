import React from "react";

export default class Autocomplete extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            inputVal: ""
        };

        this.updateInput = this.updateInput.bind(this);
        this.clickName = this.clickName.bind(this);
    }

    updateInput(e) {
      const input = e.currentTarget;
      this.setState({inputVal: input.value});
    }

    match() {
        const matched = [];
        const { inputVal } = this.state;
        const { names } = this.props;
        
        if (inputVal === "") {
            return names;
        }

        names.forEach(name => {
            if (name.match(inputVal)) {
                matched.push(name);
            }
        });

        return matched;
    }

    clickName(e) {
      e.preventDefault();
      const a = e.currentTarget;
      this.setState({inputVal: a.innerHTML});
    }

    render() {
        const { inputVal } = this.state;
        const names = this.match();

        return (
          <div>
            <h2>Autocomplete</h2>
            <div className="autocomplete">
                <input type="text" value={ inputVal } onChange={ this.updateInput }/>
                <ul>
                   { names.map((name, idx) => (<li key={idx}><a href="#" onClick={this.clickName}>{name}</a></li>)
      
                  )
                  }
                </ul>
            </div>
          </div>
        );
    }
}