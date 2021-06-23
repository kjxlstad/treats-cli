# Chromium backend due to matlaget api key difficulties
puppeteer = require 'puppeteer'

# Parsing
select = (elem, selector) ->
	elem.querySelector('.menu-item__' + selector).innerText

parse = (day) ->
	head:      select(day, 'heading')
	desc:      select(day, 'description')
	allergens: select(day, 'list')

# Scraping
scrape = () ->
	browser = await puppeteer.launch()
	page = await browser.newPage()
	await page.goto('https://www.treats.no/')
	
	await page.waitForSelector('.menu-list')
	week = await page.evaluate () ->
		(parse day for day in document.querySelectorAll('.menu-day'))

	#menu = (parseDay day for day in days[...5])
	console.log week
	await browser.close()

scrape()
