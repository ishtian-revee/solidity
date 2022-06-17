// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    
    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        retrieve();     // will cost gas
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function add() public pure returns(uint256) {
        return (1+1);
    }
}

// notes:
// visibility types: public, private, internal, external
// View and pure functions when called alone, don't spend gas. We only spend gas when we only modify the state of a blockchain
// view functions are just for read data and disallows any modification of state
// pure function also same as 'view' function but additionally disallow you to read from blockchain state
// if a gas calling function calls a vie or pure function - only then it will cost gas
// returns(...) => what this function will give us
// every generated smart contract has addres: 0xd9145CCE52D386f254917e481eB44e9943F39138