// The ONE place to enable the App Store button. Paste the app's App Store URL between the quotes
// once it is live (e.g. "https://apps.apple.com/app/id1234567890"). Leave empty for "coming soon".
// When the URL is set, Apple's official App Store badge SVG may replace this button, unaltered.
// Until then this is a plain text button in the site's own style, never an imitation of the badge.
const APP_STORE_URL = "https://apps.apple.com/app/id6830896390";

document.querySelectorAll("[data-app-store]").forEach((el) => {
  if (!APP_STORE_URL) {
    el.addEventListener("click", (e) => e.preventDefault());
    return;
  }
  el.href = APP_STORE_URL;
  el.removeAttribute("aria-disabled");
  const label = el.querySelector("[data-label]");
  if (label) label.textContent = "Download on the App Store";
});
