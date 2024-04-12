const HDWalletProvider = require('@truffle/hdwallet-provider');
const mnemonic = "again body rocket work shed jar idea settle pool raise episode multiply";
const infuraProjectId = "52152afd9e9645eb9951d13c294cce02";

module.exports = {
  compilers: {
    solc: {
      version: "0.8.13"
    }
  },
  networks: {
    sepolia: {
      provider: () => new HDWalletProvider(mnemonic, `https://sepolia.infura.io/v3/${infuraProjectId}`),
      network_id: 11155111,
      chain_id: 11155111,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
    develop: {
      port: 9545
    }
  }
};
