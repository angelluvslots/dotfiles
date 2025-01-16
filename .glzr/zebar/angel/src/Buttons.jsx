import PropTypes from "prop-types";
import { useState } from "react";
import "./Buttons.css";

function Buttons({ buttons }) {
  const [color, setColor] = useState("");

  return (
    <div className="buttons" style={{ "--buttons-color": color }}>
      {buttons.map(({ icon, action, color }, i) => <Button icon={icon} action={action} color={color} setColor={setColor} key={i} />)}
    </div >
  )
}

Buttons.propTypes = {
  buttons: PropTypes.array,
}

function Button({ icon, action, color, setColor }) {
  return (
    <button className={`button ${icon}`} onClick={action} style={{ "--button-color": color }} onMouseEnter={() => setColor(color)} >
    </button >
  )
}

Button.propTypes = {
  action: PropTypes.func,
  icon: PropTypes.string,
  color: PropTypes.string,
  setColor: PropTypes.func,
};

export default Buttons;
