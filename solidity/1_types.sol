// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // Types: boolean, uint, int, string, address, byte
    bool isFavourite = true;
    uint256 numberUint = 11;        // unit is by default uint256
    int256 numberInInt = -20;   // can be negative
    string numberInText = "123";
    address myAddress = 0x448165155b0c8660A8D937B37620c42dF8A0BA9c;
    bytes32 favouriteByte = "rev";
}