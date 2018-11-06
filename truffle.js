var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "high board wide wheat belt north path above jeans spell ignore limit bridge dwarf whisper";
// m/44'/60'/0'/0/0:	0x8523e480DbD41070c7522Fd58559ad6dC8A003aE
// m/44'/60'/0'/0/1:	0x6A8f6A6cb5D7fA8b3a1fe18e6541e454a1e611D8
/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
			provider: function() {
				return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/461bbbb13969418bb95a1297c8ddc25f", 0);
			},
			network_id: 4
		}
  }
};
