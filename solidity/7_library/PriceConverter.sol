// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal view returns(uint256) {
        // ABI
        // ethereum data feed address (ETH/USD): 0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);    // 1**10 == 10000000000
    }

    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        return (getPrice() * ethAmount) / 1e18;
    }

}