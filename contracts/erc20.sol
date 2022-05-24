// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Interfaces/ILendingPoolAddressesProvider.sol";

/// @custom:security-contact 0xconcordance@protonmail.com
contract SafeWrappedDollar is ERC20, ERC20Burnable, Pausable, Ownable {

    address aaveDeposit;
    address sUSDContractAddr;
    address chainLinkOracle;
    address lendingPoolAddressProviderAddr;
    IERC20 sUSDContract = IERC20(address(sUSDContractAddr)); 

    /* 
    AAVE ADDRESSES:
        - PoolAddressesProvider
        - 
    */

    constructor(
        address _aaveDeposit, 
        address _sUSDContractAddr, 
        address _chainLinkOracle,
        address _lendingPoolAddressProviderAddr
        ) 
        ERC20("safeWrappedDollar", "swUSD") {
            aaveDeposit = _aaveDeposit;
            sUSDContractAddr = _sUSDContractAddr;
            chainLinkOracle = _chainLinkOracle;
            lendingPoolAddressProviderAddr = _lendingPoolAddressProviderAddr;
        }
    
    

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    /*
    MINT:
        - requires sUSD
        - contract transfers and deposits into Aave
        - mints 1-1 sUSD
    */

    function mintSafeUSD(uint _amount) public {
        // transfer _amount to contract
        //  deposit into aave
        // mint _amount of tokens to user


        // mint sUSD
        _mint(msg.sender, _amount);
    }

}

interface LendingPool {
    function deposit(address _reserve, uint256 _amount, uint16 _referralCode) external;
}