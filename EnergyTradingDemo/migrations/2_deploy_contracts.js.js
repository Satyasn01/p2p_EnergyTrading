const EnergyTrading = artifacts.require("EnergyTrading");

module.exports = function (deployer, network, accounts) {
  if (network === "sepolia") {  // Check if deploying to Sepolia network
    deployer.deploy(EnergyTrading, { gas: 8000000 });
  }
};
