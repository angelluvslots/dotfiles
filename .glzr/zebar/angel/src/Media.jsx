import PropTypes from "prop-types";
import Buttons from "./Buttons.jsx";
import "./Media.css";

function limitLength(str, len, ending = "...") {
  return str.length <= len ? str : str.slice(0, len - ending.length) + ending;
}

function Media({ media }) {
  return (
    media?.currentSession?.artist && (
      <div className="media">
        <Buttons
          buttons={[
            {
              icon: "nf nf-md-skip_previous",
              action: async () => await media.previous(),
              color: "var(--color-media-previous)",
            },
            {
              icon: `nf ${media.currentSession.isPlaying ? "nf-md-pause" : "nf-md-play"}`,
              action: async () => await media.togglePlayPause(),
              color: "var(--color-media-pause)",
            },
            {
              icon: "nf nf-md-skip_next",
              action: async () => await media.next(),
              color: "var(--color-media-next)",
            },
          ]}
        />
        <div className="media-artist">
          {limitLength(media.currentSession.artist, 24)}
        </div>
        -
        <div className="media-title">
          {limitLength(media.currentSession.title, 48)}
        </div>
      </div>
    )
  );
}

Media.propTypes = {
  media: PropTypes.any,
};

export default Media;
