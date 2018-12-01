const CryptoMus = artifacts.require("./CryptoMus.sol");

module.exports = function(deployer) {
    deployer.deploy(CryptoMus);
}