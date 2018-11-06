const CryptoLand = artifacts.require("./Cryptoland.sol");

module.exports = function(deployer) {
    deployer.deploy(CryptoLand);
}