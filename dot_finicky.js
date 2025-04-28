// ~/.finicky.js

module.exports = {
  defaultBrowser: "Firefox",

  handlers: [
    {
      // Open apple.com and example.com urls in Safari
      match: [
        /.*openai.com/,
        /.*chatgpt.com/,
        /.*claude.ai/,
        /.*apple.com/,
        // /discover.*.com/,
        // /chase.com/,
        // /americanexpress/,
        // /bank.com/,
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
