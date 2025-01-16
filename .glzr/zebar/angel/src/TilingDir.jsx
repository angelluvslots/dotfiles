import PropTypes from "prop-types";
import Buttons from "./Buttons.jsx";
import "./TilingDir.css";

function TilingDir({ glazewm }) {
  return glazewm && (
    <div className="tiling-dir">
      <Buttons
        buttons={[{
          action: () => glazewm.runCommand("toggle-tiling-direction"),
          icon: `nf ${glazewm.tilingDirection === "horizontal"
            ? "nf-md-swap_horizontal"
            : "nf-md-swap_vertical"
            }`,
          color: "var(--color-tiling-dir)",
        }]}
      />
    </div>
  );
}

TilingDir.propTypes = {
  glazewm: PropTypes.any,
};

export default TilingDir;
