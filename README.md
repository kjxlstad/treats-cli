# treats-cli

WiP cli for quickly grabbing the treats cafeteria menu.

## requirements
Due to treats content being loaded with api calls, they aren't as easily scraped. The api authorization key also changes with every call, and the key generator is buried somewhere in a 100k line obfuscated script. This then uses puppeteer instead to emulate a chromium browser in the background, enabling easy albeit rather slow fetching of the weekly menu.

```sh
npm i puppeteer
```

## usage
- Fetch entire menu: ```sh treats```
- Fetch days by name: ```sh treays monday```
- Fetch relative days: ```sh treats tomorrow```
