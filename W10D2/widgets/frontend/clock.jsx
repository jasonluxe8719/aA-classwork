import React from "react";

class Clock extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            time: new Date()
        };
    }

    tick() {
        this.setState({ time: new Date() });
    }

    componentDidMount() {
        this.intervalId = setInterval(() => this.tick(), 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);
    }

    render() {
        const { time } = this.state;
        const timeArr = time.toUTCString().split(" ");

        return (
            <>
            <h2>Clock</h2>
            <div className="clock">
                <div className="time">
                  <span>Time: </span>
                  <span>{timeArr[timeArr.length - 2]} {timeArr[timeArr.length - 1]}</span>
                </div>
                <div className="date">
                  <span>Date: </span>
                  <span>{time.toDateString()}</span>
                </div>
            </div>
            </>
        );
    }
}

export default Clock;