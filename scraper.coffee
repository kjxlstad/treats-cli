# Chromium backend due to matlaget api key difficulties
puppeteer = require 'puppeteer'

# Parsing
select = (elem, selector) ->
	elem.querySelector('.menu-item__' + selector).innerText

struct = (day) ->
	head:      select(day, 'heading')
	desc:      select(day, 'description')
	allergens: select(day, 'list')
	
parse = (document) ->
	struct day for day in document.querySelectorAll('.menu-day')[0..5]

# Scraping
scrape = (days) ->
	browser = await puppeteer.launch()
	page = await browser.newPage()
	
	await page.goto('https://www.treats.no/')
	await page.waitForSelector('.menu-list')
	
	week = await page.evaluateHandle ->
		document.querySelectorAll '.menu-day'
		
	await browser.close()

	return struct week[day] for day in days

# Entry
exports.menu = (days) ->
	scrape days
