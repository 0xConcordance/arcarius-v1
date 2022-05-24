// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact 0xconcordance@protonmail.com
contract SafeWrappedDollar is ERC20, ERC20Burnable, Pausable, Ownable {


    address aaveDeposit;
    address sUSDContract;
    address chainLinkOracle;
    IERC20 sUSDContract;

    constructor(
        address _aaveDeposit, 
        address _sUSDContract, 
        address _chainLinkOracle) 
        ERC20("safeWrappedDollar", "swUSD") {
            aaveDeposit = _aaveDeposit;
            sUSDContract = _sUSDContract;
            chainLinkOracle = _chainLinkOracle;
            sUSDContract = IERC20(address())
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
    }




}