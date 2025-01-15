import PropTypes from "prop-types";
import { useState } from "react";
import "./Buttons.css";

function Buttons({ buttons, defaultColor, }) {
  const [color, setColor] = useState(defaultColor);

  function resetColor() {
    setColor(defaultColor);
  }

  return (
    <div className="buttons" style={{ "--buttons-color": color }}>
      {buttons.map(({ icon, action, color }, i) => <Button icon={icon} action={action} color={color} setColor={setColor} resetColor={resetColor} key={i} />)}
    </div >
  )
}

Buttons.propTypes = {
  buttons: PropTypes.array,
  defaultColor: PropTypes.string,
}

function Button({ icon, action, color, setColor, resetColor }) {
  return (
    <button className={`button ${icon}`} onClick={action} style={{ "--button-color": color }} onMouseEnter={() => setColor(color)} onMouseLeave={() => resetColor()} >
    </button >
  )
}

Button.propTypes = {
  action: PropTypes.func,
  icon: PropTypes.string,
  color: PropTypes.string,
  setColor: PropTypes.func,
  resetColor: PropTypes.func,
};

export default Buttons;
