// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Fund {

    uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable {
        // want to be able to set a minimum fund amount in USD

        // require() => works like a checker
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough!");  // 1e18 == 1 * 10 ** 18 == 1000000000000000000 wei == 1 ETH

        // what is reverting?
        // undo any action before, and send remaining gas back
    }

    function getPrice() public view returns(uint256) {
        // ABI
        // ethereum data feed address (ETH/USD): 0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 3000.00000000
        // type casting
        return uint256(price * 1e10);    // 1**10 == 10000000000
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xaEA2808407B7319A31A383B6F8B60f04BCa23cE2);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        return (getPrice() * ethAmount) / 1e18;
    }

    // function withdraw() {}
}

/*

NOTES:

AggregatorV3Interface.latestRoundData() returns object

(
    uint80 roundID,
    int price,
    uint startedAt,
    uint timeStamp,
    uint80 answeredInRound
)

*/