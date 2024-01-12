require('dotenv').config();
require('@nomiclabs/hardhat-ethers');
/** @type import('hardhat/config').HardhatUserConfig */

const { WEB3_PROVIDER_URL, PRIVATE_KEY } = process.env;

if (!WEB3_PROVIDER_URL || !PRIVATE_KEY) {
  throw new Error('Please set both WEB3_PROVIDER_URL and PRIVATE_KEY in your .env file');
}

module.exports = {
  solidity: '0.8.19',
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      url: WEB3_PROVIDER_URL,
      accounts: [PRIVATE_KEY],
      gas: 2100000,
      gasPrice: 8000000000,
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API
  }
};
