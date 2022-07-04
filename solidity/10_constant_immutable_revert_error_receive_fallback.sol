// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

error NotOwner();

contract Fund {

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address public immutable i_owner;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!");  // 1e18 == 1 * 10 ** 18 == 1000000000000000000 wei == 1 ETH
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // setting modifier
    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);

        // (bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{value: address(this).balance}("");
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");
    }

    modifier onlyOwner {
        // _;  // it means doing the rest of the codes before modifier code
        require(msg.sender == i_owner, "Sender is not owner!");
        if (msg.sender != i_owner) { revert NotOwner(); }
        _;  // it means doing the rest of the codes after modifier code
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}