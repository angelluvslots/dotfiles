import { useState, useEffect } from "react";
import PropTypes from "prop-types";
import Media from "./Media.jsx";
import ProcessName from "./ProcessName.jsx";
import Workspaces from "./Workspaces.jsx";
import Weather from "./Weather.jsx";
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
        <Workspaces glazewm={output.glazewm} />
        <Media media={output.media} />
      </div>

      <div className="center">
        <ProcessName glazewm={output.glazewm} />
      </div>

      <div className="right">
        {output.glazewm && (
          <button
            className={`tiling-direction button button-bg no-margin nf ${output.glazewm.tilingDirection === "horizontal" ? "nf-md-swap_horizontal" : "nf-md-swap_vertical"}`}
            onClick={() => output.glazewm.runCommand("toggle-tiling-direction")}
          ></button>
        )}
        {output.date && (
          <div className="date">
            <i className="nf nf-md-calendar"></i>
            {output.date.formatted.split("|")[0].toLowerCase()}
          </div>
        )}
        {output.date && (
          <div className="time">
            <i className="nf nf-oct-clock"></i>
            {output.date.formatted.split("|")[1].toLowerCase()}
          </div>
        )}
        <Weather weather={output.weather} />
      </div>
    </div>
  );
}

App.propTypes = {
  providers: PropTypes.any,
};

export default App;
