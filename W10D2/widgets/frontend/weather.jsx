import React from "react";

export default class Weather extends React.Component {  
    constructor(props) {
        super(props);

        this.state = {
            weather: null
        };
    }

    openWeather(pos) { 
        const crd = pos.coords;
        const apiKey = "1bc00f6a32fc025996cd09656a2efdb9";
        const url = `http://api.openweathermap.org/data/2.5/weather?lat=${crd.latitude}&lon=${crd.longitude}&appid=${apiKey}`;
        const xmlhttp = new XMLHttpRequest();

        xmlhttp.onreadystatechange = () => {
            if (xmlhttp.readyState == XMLHttpRequest.DONE) {   // XMLHttpRequest.DONE == 4
                if (xmlhttp.status == 200) {
                    const response = JSON.parse(xmlhttp.responseText);
                    this.setState({ weather: response });
                }
                else if (xmlhttp.status == 400) {
                    alert('There was an error 400');
                }
                else {
                    alert('something else other than 200 was returned');
                }
            }
        };

        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    componentDidMount() {
        navigator.geolocation.getCurrentPosition(this.openWeather.bind(this));
    }

    render() {
      const weather = this.state.weather;
      let name = null;
      let temp = null;
      if(weather) {
        name = weather.name;
        temp = weather.main.temp;
      }
      return (
          <>
            <h2>Weather</h2>
            <div className="weather">
                <div className="location">{name || "No information"}</div>
                <div className="temp">{((temp - 273.15) * 9 / 5 + 32).toFixed(1)}</div>
            </div>
          </>

      );

    }

}