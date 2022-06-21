// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

// set "is ContractName" if the current contract inheriting from another contract
contract ExtraStorage is SimpleStorage {

    // set 'override' here keyword if the function is overriding from parent class
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}