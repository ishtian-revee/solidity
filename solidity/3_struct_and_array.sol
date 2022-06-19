// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    
    uint256 favoriteNumber;

    struct People {
        uint256 number;
        string name;
    }

    // single struct object
    People public person1 = People({number: 11, name: "revee"});

    People[] public people;     // Dynamic array: the size of the array is not predefined
    People[3] public people1;   // array size given

    function addPerson(string memory _name, uint256 _number) public {
        people.push(People(_number, _name));
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        retrieve();     // will cost gas
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}