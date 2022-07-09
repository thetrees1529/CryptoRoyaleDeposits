/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-ethers")
module.exports = {
  solidity: "0.8.15",
  networks: {
    mainnet: {
      url: "https://api.harmony.one",
      accounts: [require("./privateKey.json")]
    }
  }
};
