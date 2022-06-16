// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// file: arcUsdV1.sol

// DESCRIBTION
// arcUsdV1 is a stablecoin backed by another stablecoin
// this is a very simple implementation and will be expanded in other versions

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ArcUSD is ERC20, ERC20Burnable, Pausable, Ownable {

    event mintedArcUSD(uint amount, address receiver);

    address sUsdAddress;
    IERC20 sUSDContract = IERC20(address(sUsdAddress));

    constructor(
        address _sUsdAddress
    ) ERC20("arcariusUSD", "arcUSD") {
        sUsdAddress = _sUsdAddress;
    }

    // Deposit Function
    // Transfer the Users funds and mint stablecoins
    function _mintArcUsd(uint _amount) public {

        sUSDContract.transferFrom(msg.sender, address(this), _amount);
        _mint(msg.sender, _amount);

        emit mintedArcUSD(_amount, msg.sender);
    }
}