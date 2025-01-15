import PropTypes from "prop-types";
import "./Weather.css";

// Get icon to show for current weather status.
function getWeatherIcon(weatherOutput) {
  switch (weatherOutput.status) {
    case "clear_day":
      return <i className="nf nf-md-weather_sunny"></i>;
    case "clear_night":
      return <i className="nf nf-md-weather_night"></i>;
    case "cloudy_day":
      return <i className="nf nf-md-weather_cloudy"></i>;
    case "cloudy_night":
      return <i className="nf nf-md-weather_cloudy"></i>;
    case "light_rain_day":
      return <i className="nf nf-md-weather_rainy"></i>;
    case "light_rain_night":
      return <i className="nf nf-md-weather_rainy"></i>;
    case "heavy_rain_day":
      return <i className="nf nf-md-weather_pouring"></i>;
    case "heavy_rain_night":
      return <i className="nf nf-md-weather_pouring"></i>;
    case "snow_day":
      return <i className="nf nf-md-weather_snowy_heavy"></i>;
    case "snow_night":
      return <i className="nf nf-md-weather_snowy_heavy"></i>;
    case "thunder_day":
      return <i className="nf nf-md-weather_lightning_rainy"></i>;
    case "thunder_night":
      return <i className="nf nf-md-weather_lightning_rainy"></i>;
  }
}

function Weather({ weather }) {
  return weather && (
    <div className={`weather ${weather.status}`}>
      {getWeatherIcon(weather)}
      {Math.round(weather.fahrenheitTemp)}°F
    </div>
  )
}

Weather.propTypes = {
  weather: PropTypes.any,
}

export default Weather;
