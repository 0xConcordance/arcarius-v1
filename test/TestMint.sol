// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/erc20.sol";

contract TestMint{


    function testMint() public {
        uint a = 0;
        uint b = 2;

        Assert.equal(a + b, 2, "Addition should be 2.");
    }



}