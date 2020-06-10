import React from "react";

export default class Tabs extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            index: 0
        };

        this.onTabClicked = this.onTabClicked.bind(this);
    }

    onTabClicked(e){
        const li = e.currentTarget;
        this.setState({index: parseInt(li.dataset.idx)});

    }

    render() {
        const {index} = this.state; // const index = this.state.index;
        const selected = this.props.tabs[index];

        return (
            <div>
            <h2>Tabs</h2>
            <div className="tab">
                <ul>
                    {
                        this.props.tabs.map((tab, idx) => (
                            <li key={idx} 
                            data-idx={idx}
                            onClick={this.onTabClicked}
                            className={idx === index ? 'selected' : ''}
                            > 
                                <h1>{ tab.title }</h1>  
                            </li>                          
                        ))
                    }
                </ul>
                <article>{ selected.content }</article>
                
            </div>
            </div>
        );
    }
}