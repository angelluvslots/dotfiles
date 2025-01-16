import PropTypes from "prop-types";
import "./Date.css";

function Date({ date }) {
  return (
    date && (
      <div className="date"
        onClick={() =>
          navigator.clipboard.writeText(
            date.formatted
              .toLowerCase()
              .replace("|", "-")
              .replaceAll(":", "-")
              .replaceAll(" ", "-")
          )}
      >
        <i className="nf nf-md-calendar"></i>
{ date.formatted.split("|")[0].toLowerCase() }  
      </div>
    )
  );
}

Date.propTypes = {
  date: PropTypes.any,
};

export default Date;
