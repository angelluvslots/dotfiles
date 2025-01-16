import PropTypes from "prop-types";
import Buttons from "./Buttons.jsx";
import "./TilingDir.css";

function TilingDir({ glazewm }) {
  return glazewm && (
    <Buttons
      buttons={[{
        action: () => glazewm.runCommand("toggle-tiling-direction"),
        icon: `tiling-dir nf ${glazewm.tilingDirection === "horizontal"
          ? "nf-md-swap_horizontal"
          : "nf-md-swap_vertical"
          }`,
        color: "var(--color-tiling-dir)",
      }]}
    />
  );
}

TilingDir.propTypes = {
  glazewm: PropTypes.any,
};

export default TilingDir;
