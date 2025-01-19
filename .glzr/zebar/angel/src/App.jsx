import { useState, useEffect } from "react";
import PropTypes from "prop-types";
import Media from "./Media.jsx";
import ProcessName from "./ProcessName.jsx";
import Workspaces from "./Workspaces.jsx";
import Weather from "./Weather.jsx";
import Time from "./Time.jsx";
import Date from "./Date.jsx";
import TilingDir from "./TilingDir.jsx";
import "./App.css";

function App(props) {
  const providers = props.providers;

  const [output, setOutput] = useState(providers.outputMap);

  useEffect(() => {
    providers.onOutput(() => setOutput(providers.outputMap));
  }, []);

  console.log(output.glazewm)

  return (
    <div className="app">
      <div className="left">
        <TilingDir glazewm={output.glazewm} />
        <Workspaces glazewm={output.glazewm} />
        <Media media={output.media} />
      </div>

      <div className="center">
        <ProcessName glazewm={output.glazewm} />
      </div>

      <div className="right">
        <Date date={output.date} />
        <Time date={output.date} />
        <Weather weather={output.weather} />
      </div>
    </div>
  );
}

App.propTypes = {
  providers: PropTypes.any,
};

export default App;
