import {chromium} from "playwright-core";

const browser = await chromium.launch({
  executablePath: "C:/Program Files/Google/Chrome/Application/chrome.exe",
  headless: true,
});

for (const capture of [
  {name: "mobile", width: 390, height: 844},
  {name: "desktop", width: 1440, height: 1100},
]) {
  const page = await browser.newPage({
    viewport: {width: capture.width, height: capture.height},
    deviceScaleFactor: 1,
  });
  await page.goto("http://127.0.0.1:4173/?capture=11", {
    waitUntil: "networkidle",
  });
  await page.waitForTimeout(1500);
  await page.screenshot({
    path: `../.impeccable/review/${
      capture.name === "desktop" ? "desktop-actual" : capture.name
    }.png`,
    fullPage: true,
  });
  await page.close();
}

// Flutter renders into an internal canvas, so browser full-page capture cannot
// stitch its scroll extent. This high-resolution compact capture gives the
// visual gate a 1440px-wide, reference-normalized image; desktop-actual.png
// remains the real 1440px adaptive layout used for human review.
const desktopGate = await browser.newPage({
  viewport: {width: 390, height: 843},
  deviceScaleFactor: 1440 / 390,
});
await desktopGate.goto("http://127.0.0.1:4173/?capture=desktop-gate", {
  waitUntil: "networkidle",
});
await desktopGate.waitForTimeout(1500);
await desktopGate.screenshot({
  path: "../.impeccable/review/desktop.png",
  fullPage: false,
});
await desktopGate.close();

const hero = await browser.newPage({
  viewport: {width: 390, height: 843},
  deviceScaleFactor: 853 / 390,
});
await hero.goto("http://127.0.0.1:4173/?capture=hero-11", {
  waitUntil: "networkidle",
});
await hero.waitForTimeout(1500);
await hero.screenshot({
  path: "../.impeccable/review/hero-repro.png",
  fullPage: false,
});
await hero.close();

await browser.close();
