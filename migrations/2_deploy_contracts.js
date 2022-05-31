var erc20 = artifacts.require("./erc20.sol");

const _sUSDContractAddress = "0x6883D765088f90bAE62048dE45f2202D72985B01";
const _chainLinkOracle = "0x6883D765088f90bAE62048dE45f2202D72985B01"; // placeholder
const _aavePoolProvider = "0xD15d36975A0200D11B8a8964F4F267982D2a1cFe";

module.exports = function(deployer, network, accounts) {
  deployer.deploy(erc20, _sUSDContractAddress, _chainLinkOracle, _aavePoolProvider, {from: accounts[0]});
};
