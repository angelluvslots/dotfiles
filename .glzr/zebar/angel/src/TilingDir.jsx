import PropTypes from "prop-types";
import Buttons from "./Buttons.jsx";
import "./TilingDir.css";

function TilingDir({ glazewm }) {
  return (
    glazewm && (
      <div className="tiling-dir">
        <Buttons
          buttons={[
            {
              action: () => glazewm.runCommand("toggle-tiling-direction"),
              icon: `nf ${glazewm.tilingDirection === "horizontal"
                ? "nf-md-swap_horizontal"
                : "nf-md-swap_vertical"
                }`,
              color: glazewm.tilingDirection === "horizontal" ? "var(--color-tiling-dir-h)" : "var(--color-tiling-dir-v",
            },
          ]}
        />
      </div>
    )
  );
}

TilingDir.propTypes = {
  glazewm: PropTypes.any,
};

export default TilingDir;
