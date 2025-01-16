import PropTypes from "prop-types";
import "./Time.css";

function Time({ date }) {
  return (
    date && (
      <div
        className="time"
        onClick={() =>
          navigator.clipboard.writeText(
            date.formatted
              .toLowerCase()
              .replace("|", "-")
              .replaceAll(":", "-")
              .replaceAll(" ", "-")
          )
        }
      >
        <i className="nf nf-oct-clock"></i>
        {date.formatted.split("|")[1].toLowerCase()}
      </div>
    )
  );
}

Time.propTypes = {
  date: PropTypes.any,
};

export default Time;
