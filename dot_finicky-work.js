// ~/.finicky.js

module.exports = {
  defaultBrowser: "Firefox",

  handlers: [
    {
      match: [
        /.*apple.com/,
        /.*chatgpt.com/,
        /.*claude.ai/,
        /.*openai.com/,
        /.*openapi.com/,
      ],
      browser: "Safari",
    },
    {
      match: /workplace/,
      browser: "Firefox",
    },
    {
      match: [
        /.*google.com/,
        /google/,
        /intuit/,
        /postman/,
        /slack/,
        /codium/,
        /qodo/,
        /pointingpoker.com/,
      ],
      browser: "Google Chrome",
    },
  ],
};
