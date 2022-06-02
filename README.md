## arcarius V1
arcUSD is a ERC20 Token that is backed by a pool of different stablecoins. With UST collapsing, the risks behind stablecoins are more present than ever. Arcarius Finance provides a way to get diversified exposure to a pool of selected stablecoins, minimizing the risk. Furtermore arcUSD cannot be freezed by a central entity and is capial-efficient since you can mint $1 arcUSD by providing $1 in stablecoins. 

Arcarius V1 will be a very simple implementation of this idea. A user can mint arcUSD by providing one of a few stablecoins. Every epoch (~2h), the pool of stablecoins will be balanced by swapping the tokens so that there is an equal amount of each token (dollar denominated). This is important to ensure sufficient diversity. 

If depegging does occur, arcarius has an emergency exit function to prevent further losses. If the oracle price of a stablecoin crashes over ~5%, it can be swapped for any other supported token. 
