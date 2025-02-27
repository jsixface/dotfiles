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
        /google/,
        /intuit/,
        /postman/,
        /slack/,
      ],
      browser: "Google Chrome",
    },
  ],
};
