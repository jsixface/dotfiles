// ~/.finicky.js

export default {
  defaultBrowser: "Firefox",
  rewrite: [
    {
      // Redirect all x.com urls to use xcancel.com
      match: "x.com/*",
      url: (url) => {
        url.host = "xcancel.com";
        return url;
      },
    },
  ],
  handlers: [
    {
      // Open apple.com and example.com urls in Safari
      match: [
        /.*openai.com/,
        /.*claude.ai/,
        /.*apple.com/,
        /^https?:\/\/.*chatgpt\.com\/.*$/,  // Matches http or https URLs
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
        "*.gle/*",
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
