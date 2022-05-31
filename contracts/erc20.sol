// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact 0xconcordance@protonmail.com
contract SafeWrappedDollar is ERC20, ERC20Burnable, Pausable, Ownable {

    address sUSDContractAddr;
    address chainLinkOracle;
    address poolAddressProviderAddr;

    IERC20 sUSDContract = IERC20(address(sUSDContractAddr)); 
    IPoolAddressesProvider aavePoolAddressesProvider = IPoolAddressesProvider(poolAddressProviderAddr);

    constructor(
        address _sUSDContractAddr, 
        address _chainLinkOracle,
        address _poolAddressProviderAddr
        ) 
        ERC20("safeWrappedDollar", "swUSD") {
            sUSDContractAddr = _sUSDContractAddr;
            chainLinkOracle = _chainLinkOracle;
            poolAddressProviderAddr = _poolAddressProviderAddr;
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
        // initialize the contract
        IPool aavePoolContract = IPool(address(0x139d8F557f70D1903787e929D7C42165c4667229));

        // transfer the users fund 
        sUSDContract.transferFrom(msg.sender, address(this), _amount);
        sUSDContract.approve(address(0x139d8F557f70D1903787e929D7C42165c4667229), _amount);

        // supply the funds to the aave Pool
        aavePoolContract.supply(sUSDContractAddr, _amount, address(this), 0);

        // mint swUSD
        _mint(msg.sender, _amount);

    }

}

interface IPool {
    function supply(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) external;
    function withdraw(address asset, uint256 amount, address to) external;
}

interface IPoolAddressesProvider {
    function getPool() external view returns (address);
}