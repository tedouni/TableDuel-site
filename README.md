# Table Duel site

Static marketing and support site for the Table Duel iOS app. Plain HTML and CSS, one tiny JS file, no build step, no analytics, no cookies.

| File | Purpose |
|---|---|
| `index.html` | Home / marketing page (also the Marketing URL) |
| `support.html` | Support page with FAQ and contact email |
| `privacy.html` | Privacy Policy (effective 2026-11-08) |
| `terms.html` | Terms of Use (points to Apple's standard EULA) |
| `404.html` | Not-found page (uses root-absolute paths) |
| `assets/style.css`, `assets/favicon.svg`, `assets/site.js` | Styles, icon, App Store badge switch |
| `assets/fonts/` | Big Shoulders (OFL, the app's display face), subset to Latin as woff2, with its licence |
| `assets/img/` | App icon, achievement badges and simulator screenshots used on the pages |
| `robots.txt`, `sitemap.xml` | Crawler files  |
| `scripts/set-domain.sh` | Sets the real domain everywhere and writes `CNAME` |

## Preview locally

```sh
python3 -m http.server 8000 --bind 127.0.0.1
# open http://127.0.0.1:8000
```

## Things to fill in

1. **Domain.** Already set to `tableduel.games` (canonical links, `og:url`, `robots.txt`, `sitemap.xml`). To use a different domain, run
   `scripts/set-domain.sh tableduel.app`. It rewrites every file and writes `CNAME`.
   For a GitHub project page without a custom domain, use `scripts/set-domain.sh youruser.github.io/table-duel-site` (no CNAME is written).
2. **App Store link.** Edit the single constant `APP_STORE_URL` in `assets/site.js`. It is set to the live listing (id6830896390); if emptied, the button falls back to disabled "Coming soon" text.
   The badge markup is marked `APP STORE BADGE` in `index.html`; if you want Apple's official badge artwork, use Apple's marketing guidelines.
3. **Screenshots.** The pages use simulator captures in `assets/img/` (`duo-*.webp`, `phone-*.webp`, `ipad-*.webp`).
   Re-capture them from the app repo's simulators after a visual change and resize (Duo spread about 1600 px wide,
   phones 560 px wide); keep the `width`/`height` attributes in the `<img>` tags in step with the files.
4. **Social image.** `assets/og-image.png` (1200x630) is the OG and Twitter image on every page. Regenerate it if the app icon or the Duo hero screenshot changes.
5. **Legal review.** Have the Privacy Policy and Terms reviewed before launch.

## Deploy to GitHub Pages

1. Create a GitHub repo (not done by this project), then `git remote add origin ... && git push -u origin main`.
2. In the repo: Settings, Pages, Source "Deploy from a branch", branch `main`, folder `/ (root)`.
3. Custom domain: run `scripts/set-domain.sh your-domain.com` (creates `CNAME`), commit and push, set the same domain under Settings, Pages, Custom domain, add a DNS record (CNAME to `youruser.github.io`, or A records for an apex domain), then tick Enforce HTTPS.
4. A `404.html` at the root is served automatically for unknown paths. It uses root-absolute asset paths, so it looks right on a custom domain but not under a `/repo-name/` project path.

Cloudflare Pages also works: connect the repo, no build command, output directory `/`.

## URLs for App Store Connect

Replace `tableduel.games` with the real domain:

- Support URL: `https://tableduel.games/support.html`
- Marketing URL: `https://tableduel.games/`
- Privacy Policy URL: `https://tableduel.games/privacy.html`

## Keep in sync with the app

The privacy policy says the app collects no data (1.0 ships with no analytics; `NoTelemetry` in `TableDuel/Services/TelemetryClient.swift`). Update it if analytics, SDKs or any data collection are added.
