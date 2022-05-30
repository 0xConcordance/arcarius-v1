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
All logic is handled directly in the ERC20 Token. Why? Because it's easy. The protocol is not meant to be upgraded. 

### Addresses:
#### Opitmistic-Kovan Testnet:
- sUSD: 0x6883D765088f90bAE62048dE45f2202D72985B01
- Aave Pool: 0x139d8F557f70D1903787e929D7C42165c4667229
- Aave PoolAddressesProvider: 0xD15d36975A0200D11B8a8964F4F267982D2a1cFe
- Uniswap: N/A

#### Aave v3 Deposit procedure
- contract Pool
	- function supply(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) 
	- function withdraw(address asset, uint256 amount, address to)

- PoolAddressesProvider
	- function getPool() external view override returns (address)
