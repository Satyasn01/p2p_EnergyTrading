// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnergyTrading {
    // Define the structure of a trade
    struct Trade {
        address seller;
        address buyer;
        uint256 energyAmount;
        uint256 price;
    }

    // Array to store trades
    Trade[] public trades;

    // Mapping to track renewable energy incentives for addresses
    mapping(address => uint256) public renewableEnergyIncentives;

    // Event for trade creation
    event TradeCreated(address indexed seller, address indexed buyer, uint256 energyAmount, uint256 price);

    // Function to facilitate P2P trading
    function createTrade(address _buyer, uint256 _energyAmount, uint256 _price) public {
        trades.push(Trade(msg.sender, _buyer, _energyAmount, _price));
        emit TradeCreated(msg.sender, _buyer, _energyAmount, _price);
    }

    // Function to retrieve trade details based on index
    function getTrade(uint256 index) public view returns (address seller, address buyer, uint256 energyAmount, uint256 price) {
        require(index < trades.length, "Invalid trade index");

        Trade storage trade = trades[index];
        seller = trade.seller;
        buyer = trade.buyer;
        energyAmount = trade.energyAmount;
        price = trade.price;
    }

    // Function for power routing (considering renewable energy incentives)
    function routePower(address _seller, uint256 _energyAmount) public returns (uint256) {
        uint256 finalEnergyAmount = _energyAmount;

        // Check if the seller has renewable energy incentives
        if (renewableEnergyIncentives[_seller] > 0) {
            // Apply renewable energy incentive
            finalEnergyAmount += renewableEnergyIncentives[_seller];
            // Reset the incentive after using it
            delete renewableEnergyIncentives[_seller];
        }

        return finalEnergyAmount;
    }

    // Function to update renewable energy incentives
    function updateRenewableEnergyIncentives(address[] memory _addresses, uint256[] memory _incentives) public {
        require(_addresses.length == _incentives.length, "Arrays length mismatch");

        for (uint256 i = 0; i < _addresses.length; i++) {
            renewableEnergyIncentives[_addresses[i]] = _incentives[i];
        }
    }
}