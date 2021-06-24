// Generated by CoffeeScript 2.5.1
// Chromium backend due to matlaget api key difficulties
var parse, puppeteer, scrape, select, struct;

puppeteer = require('puppeteer');

// Parsing
select = function(elem, selector) {
  return elem.querySelector('.menu-item__' + selector).innerText;
};

struct = function(day) {
  return {
    head: select(day, 'heading'),
    desc: select(day, 'description'),
    allergens: select(day, 'list')
  };
};

parse = function(document) {
  var day, i, len, ref, results;
  ref = document.querySelectorAll('.menu-day').slice(0, 6);
  results = [];
  for (i = 0, len = ref.length; i < len; i++) {
    day = ref[i];
    results.push(struct(day));
  }
  return results;
};

// Scraping
scrape = async function(days) {
  var browser, day, i, len, page, week;
  browser = (await puppeteer.launch());
  page = (await browser.newPage());
  await page.goto('https://www.treats.no/');
  await page.waitForSelector('.menu-list');
  week = (await page.evaluateHandle(function() {
    return document.querySelectorAll('.menu-day');
  }));
  await browser.close();
  for (i = 0, len = days.length; i < len; i++) {
    day = days[i];
    return struct(week[day]);
  }
};

// Entry
exports.menu = function(days) {
  return scrape(days);
};