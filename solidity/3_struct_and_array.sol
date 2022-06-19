// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    
    uint256 favoriteNumber;     // automatically cast to be a Storage variable

    struct People {
        uint256 number;
        string name;
    }

    // single struct object
    People public person1 = People({number: 11, name: "revee"});

    People[] public people;     // Dynamic array: the size of the array is not predefined
    People[3] public people1;   // array size given

    // if variable of type array, struct and mapping then it needs to be specified as memory
    // string is basically array of bytes, this is why it is specified as memory
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

/*

Notes:

EVM can access and store information in six places:

1. Stack
2. Memory
3. Storage
4. Calldata
5. Code
6. Logs

- variables can be in only Memory, Storage and Calldata
- Calldata are temporary variables that are immutable or cannot be modified
- Memory are temporary variables that mutable or can be modified
- Storage is permanent variables that can be modified
- Calldata and Memory variable has access to a specific function
- Storage even has access outside of the function

*/