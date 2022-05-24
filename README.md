# stablecoin-safety-wrapper
ERC20 Token that is backed by another (yield bearing) token (e.g Aave sUSD) but includes a mechanism that swaps into ETH if the peg fails preventing more losses. The yield generated through supplying the underlying stablecoin should ideally make up for the 5%+ loss. 

Note: This is a personal project and thus all contracts are unaudited. There are many issues with this concept and is more meant to be a fun project exploring experimental ideas. 

- deposit (portion) into Aave
- earns interest
- interest payed out if peg fails >5% - based on chainlink oracle price
	- swaps all funds into ETH?
	- based on the amount of tokens held (%) you get (%) ETH 