import PropTypes from "prop-types";
import "./Workspaces.css";

function Workspaces({ glazewm }) {
  return (
    glazewm && (
      <div className="workspaces">
        {glazewm.allWorkspaces
          .toSorted((a, b) => a.name.toString() - b.name.toString())
          .map((workspace) => (
            <button
              data-workspace-name={workspace.name}
              className={`workspace workspace-color ${workspace.name === glazewm.displayedWorkspace.name && "focused"}`}
              onClick={() =>
                glazewm.runCommand(`focus --workspace ${workspace.name}`)
              }
              key={workspace.name}
            >
              <i className="nf nf-oct-dot_fill"></i>
            </button>
          ))}
      </div>
    )
  );
}

Workspaces.propTypes = {
  glazewm: PropTypes.any,
};

export default Workspaces;
