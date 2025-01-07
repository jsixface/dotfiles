// ~/.finicky.js

module.exports = {
  defaultBrowser: "Firefox",

  handlers: [
    {
      // Open apple.com and example.com urls in Safari
      match: [
        /.*openai.com/,
        /.*apple.com/,
        /.*claude.ai/,
        /.*openapi.com/,
        /.*chatgpt.com/,
      ],
      browser: "Safari",
    },
    {
      // Open any url that includes the string "workplace" in Firefox
      match: /workplace/,
      browser: "Firefox",
    },
    {
      // Open google.com and *.google.com urls in Google Chrome
      match: [
        "google.com/*", // match google.com urls
        "*.google.com/*", // match google.com subdomains
        /.*linkedin.com/,
        /.*facebook.com/,
        /.*instagram.com/,
        /.*tailscale.com/,
        /.*zoho.com/,
      ],
      browser: "Microsoft Edge",
    },
  ],
};
