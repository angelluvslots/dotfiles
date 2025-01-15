import PropTypes from "prop-types";
import "./Buttons.css";

function Buttons({ children, color }) {
  return (<div className="buttons" styles={`--color:var(${color});`}>
  </div>)
}

Buttons.propTypes = {
  children: PropTypes.arrayOf(PropTypes.element),
  color: PropTypes.string,
}

export default Button;
