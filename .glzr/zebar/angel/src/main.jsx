import React, {
  useState,
  useEffect,
} from 'https://esm.sh/react@18?dev';
import { createRoot } from 'https://esm.sh/react-dom@18/client?dev';
import * as zebar from 'https://esm.sh/zebar@2';

const providers = zebar.createProviderGroup({
  glazewm: { type: 'glazewm' },
  media: { type: 'media' },
  date: { type: 'date', formatting: 'EEE dd-mm-yyyy|tt' },
  weather: { type: 'weather' },
});

createRoot(document.getElementById('root')).render(<App />);

function App() {
  const [output, setOutput] = useState(providers.outputMap);

  useEffect(() => {
    providers.onOutput(() => setOutput(providers.outputMap));
  }, []);

  // Get icon to show for current weather status.
  function getWeatherIcon(weatherOutput) {
    switch (weatherOutput.status) {
      case 'clear_day':
        return (<i className="nf nf-md-weather_sunny"></i>);
      case 'clear_night':
        return (<i className="nf nf-md-weather_night"></i>);
      case 'cloudy_day':
        return (<i className="nf nf-md-weather_cloudy"></i>);
      case 'cloudy_night':
        return (<i className="nf nf-md-weather_cloudy"></i>);
      case 'light_rain_day':
        return (<i className="nf nf-md-weather_rainy"></i>);
      case 'light_rain_night':
        return (<i className="nf nf-md-weather_rainy"></i>);
      case 'heavy_rain_day':
        return (<i className="nf nf-md-weather_pouring"></i>);
      case 'heavy_rain_night':
        return (<i className="nf nf-md-weather_pouring"></i>);
      case 'snow_day':
        return (<i className="nf nf-md-weather_snowy_heavy"></i>);
      case 'snow_night':
        return (<i className="nf nf-md-weather_snowy_heavy"></i>);
      case 'thunder_day':
        return (<i className="nf nf-md-weather_lightning_rainy"></i>);
      case 'thunder_night':
        return (<i className="nf nf-md-weather_lightning_rainy"></i>);
    }
  }

  console.log(output.glazewm)

  return (
    <div className="app">
      <div className="left">
        {output.glazewm && (
          <div className="workspaces">
            {output.glazewm.allWorkspaces.toSorted((a, b) => a.name.toString() - b.name.toString()).map((workspace) => (
              <button
                workspaceName={workspace.name}
                className={`workspace workspace-color ${workspace.hasFocus && 'focused'}`}
                onClick={() =>
                  output.glazewm.runCommand(
                    `focus --workspace ${workspace.name}`,
                  )
                }
                key={workspace.name}
              >
                <i className="nf nf-oct-dot_fill no-margin"></i>
              </button>
            ))}
          </div>
        )}
        {output.media?.currentSession?.artist && (
          <div className="media">
            <div className="media-buttons button-bg">
              <button
                className={
                  `button no-margin nf ${output.media.currentSession.isPlaying ? 'nf-md-pause' : 'nf-md-play'}`
                }
                onClick={async () => await output.media.togglePlayPause()}
              ></button>
              <button
                className="button no-margin nf nf-md-skip_next"
                onClick={async () => await output.media.next()}
              ></button>
            </div>
            <div className="media-artist">
              {output.media.currentSession.artist?.toLowerCase()}
            </div> - <div className="media-title">
              {output.media.currentSession.title?.toLowerCase()}
            </div>
          </div>
        )}
      </div>

      <div className="center">
        {output.glazewm && (
          <div
            workspaceName={output.glazewm.displayedWorkspace.hasFocus ? output.glazewm.displayedWorkspace.name : ''}
            className={
              `process-name workspace-color ${output.glazewm.displayedWorkspace.hasFocus && 'focused'}`
            }
          >
            {
              output.glazewm.displayedWorkspace.children[0]
                ? output.glazewm.displayedWorkspace.children.find(child =>
                  child.id === output.glazewm.displayedWorkspace.childFocusOrder[0]
                ).processName
                : `[ ${output.glazewm.displayedWorkspace.name} ]`
            }
          </div>
        )}
      </div>

      <div className="right">
        {output.glazewm &&
          <button
            className={`tiling-direction button button-bg no-margin nf ${output.glazewm.tilingDirection === 'horizontal' ? 'nf-md-swap_horizontal' : 'nf-md-swap_vertical'}`}
            onClick={() =>
              output.glazewm.runCommand('toggle-tiling-direction')
            }
          ></button>
        }
        {output.date && (
          <div className="date">
            <i className="nf nf-md-calendar"></i>
            {output.date.formatted.split('|')[0].toLowerCase()}
          </div>
        )}
        {output.date && (
          <div className="time">
            <i className="nf nf-oct-clock"></i>
            {output.date.formatted.split('|')[1].toLowerCase()}
          </div>
        )}
        {output.weather && (
          <div className="weather">
            {getWeatherIcon(output.weather)}
            {Math.round(output.weather.fahrenheitTemp)}°F
          </div>
        )}
      </div>
    </div>
  );
}
