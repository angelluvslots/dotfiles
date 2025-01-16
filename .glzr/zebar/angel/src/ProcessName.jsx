import PropTypes from "prop-types";
import "./ProcessName.css";

function getName(children, focusedId) {
  const focused = children.find((child) => child.id === focusedId);

  switch (focused.type) {
    case "window":
      return focused.processName;
    default:
      return getName(focused.children, focused.childFocusOrder[0]);
  }
}

function ProcessName({ glazewm }) {
  return (
    glazewm && (
      <div
        data-workspace-name={
          glazewm.displayedWorkspace.hasFocus
            ? glazewm.displayedWorkspace.name
            : ""
        }
        className={`process-name workspace-color`}
      >
        {glazewm.displayedWorkspace.children.length > 0
          ? getName(
            glazewm.displayedWorkspace.children,
            glazewm.displayedWorkspace.childFocusOrder[0],
          )
          : "[empty]"}
      </div>
    )
  );
}

ProcessName.propTypes = {
  glazewm: PropTypes.any,
};

export default ProcessName;
