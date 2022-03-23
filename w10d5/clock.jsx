import React from "react";

class Clock extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            time: new Date()
        };
        this.tick = this.tick.bind(this);
    }

    tick(){
        this.setState({time: new Date()});
    }

    componentDidMount(){
        this.interval = setInterval(this.tick, 1000);
    }

    componentWillUnmount(){
        clearInterval(this.interval);
    }

    render() {
        const time = this.state.time
        var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        return (
            <div>
                <h1>Clock</h1>
                <h2>
                    <div id="time">Time: {time.getHours()}:{time.getMinutes()}:{time.getSeconds()} EST</div>
                    <div id="date">Date: {days[this.state.time.getDay()]} {months[this.state.time.getMonth()]} {this.state.time.getDate()} {this.state.time.getFullYear()}</div>
                </h2>
            </div>
        );
    }
}



// var day = days[now.getDay()];
// var month = months[now.getMonth()];


export default Clock;