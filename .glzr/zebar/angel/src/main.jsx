import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import * as zebar from "https://esm.sh/zebar@2";
import App from "./App.jsx";
import "./main.css";

const providers = zebar.createProviderGroup({
  glazewm: { type: "glazewm" },
  media: { type: "media" },
  date: { type: "date", formatting: "yyyy-MM-dd-EEE|tt" },
  weather: { type: "weather" },
});

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <App providers={providers} />
  </StrictMode>,
);
