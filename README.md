# stablecoin-safety-wrapper
ERC20 Token that is backed by another (yield bearing) token (e.g Aave sUSD) but includes a mechanism that swaps into ETH if the peg fails preventing further losses. The yield generated through supplying the underlying stablecoin should ideally make up for the 5%+ loss. 

Note: This is a personal project and thus all contracts are unaudited. There are many issues with this concept and is more meant to be a fun project exploring new experimental ideas. 

- deposit (portion) into Aave -> mint ERC20 Token
- Earns interest for the DAO
- can always redeem $1 worth of sUSD
- interest payed out if peg fails >5% - based on chainlink oracle price
	- swaps all funds into ETH?
	- based on the amount of tokens held (%) you get (%) of the ETH 
    - pauses contract to prevent users from selling tokens

### Contracts: 
All logic is handled directly in the ERC20 Token.

### Addresses:
#### Opitmistic-Kovan Testnet:
- sUSD: 0xaA5068dC2B3AADE533d3e52C6eeaadC6a8154c57
- Aave Deposit: N/A
- Uniswap: N/A