{ menu } = require './scraper.coffee'

# Weekday definitions and getter
DAYS =
	abs: [ 'monday', 'tuesday', 'wednesday', 'thursday', 'friday' ]
	rel: [ 'yesterday', 'today', 'tomorrow'                       ]

getDay = (day) ->
	if day in DAYS.abs
		return DAYS.abs.indexOf day
	if day in DAYS.rel
		return DAYS.rel.indexOf(name) - 2 + new Date().getDay()

# Argument parsing
parse = (args) ->
	if args.length == 0 or args[0] == 'week'
		return [0..4]
	
	if args[1] == '-'
		return [ (getDay args[0]) .. (getDay args[2]) ]
	
	if args[0] in DAYS.abs
		return (getDay arg for arg in args)
	
	if args[0] in DAYS.rel
		return (get_day arg for arg in args)

# Outputting menu results (future blessed entry)
console.log menu parse process.argv[2..]
