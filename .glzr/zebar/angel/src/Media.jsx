import PropTypes from "prop-types";
import "./Media.css";

function limitLength(str, len, ending = "...") {
  return str.length <= len ? str : str.slice(0, len - ending.length) + ending;
}

function Media({ media }) {
  return media?.currentSession?.artist && (
    <div className="media">
      <div className="media-buttons button-bg">
        <button
          className={`button no-margin nf ${media.currentSession.isPlaying ? "nf-md-pause" : "nf-md-play"}`}
          onClick={async () => await media.togglePlayPause()}
        ></button>
        <button
          className="button no-margin nf nf-md-skip_next"
          onClick={async () => await media.next()}
        ></button>
      </div>
      <div className="media-artist">
        {limitLength(media.currentSession.artist, 24)}
      </div>
      -
      <div className="media-title">
        {limitLength(media.currentSession.title, 48)}
      </div>
    </div>
  )
}

Media.propTypes = {
  media: PropTypes.any,
};

export default Media;
