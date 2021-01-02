const express = require("express");
const astro = require("tamil-astro");
const path = require("path");
const app = express();
const port = process.env.PORT || 3000;

let PredictionMap = {};

app.get("/today", async (_, res) => {
  const today = new Date().toISOString().split("T")[0];
  let astroData;
  if (Object.keys(PredictionMap).includes(today)) {
    astroData = PredictionMap[today];
    console.log("fetches from cache");
  } else {
    const htmlContent = await astro.fetchAstroHtml();
    astroData = await astro.getAstroData(htmlContent);
    PredictionMap[today] = astroData;
  }
  res.json(astroData);
});

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "pages/index.html"));
});

app.listen(port, () => {
  console.log(`Application listening at http://localhost:${port}`);
});
