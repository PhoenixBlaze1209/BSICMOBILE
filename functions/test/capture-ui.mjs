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
  await page.goto("http://127.0.0.1:4173/?capture=3", {
    waitUntil: "networkidle",
  });
  await page.waitForTimeout(1500);
  await page.screenshot({
    path: `../.impeccable/review/${capture.name}.png`,
    fullPage: false,
  });
  await page.close();
}

const hero = await browser.newPage({
  viewport: {width: 390, height: 843},
  deviceScaleFactor: 853 / 390,
});
await hero.goto("http://127.0.0.1:4173/?capture=hero", {
  waitUntil: "networkidle",
});
await hero.waitForTimeout(1500);
await hero.screenshot({
  path: "../.impeccable/review/hero-repro.png",
  fullPage: false,
});
await hero.close();

await browser.close();
