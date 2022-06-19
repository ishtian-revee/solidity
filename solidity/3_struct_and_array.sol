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

    mapping(string => uint256) public nameToNumber;

    // if variable of type array, struct and mapping then it needs to be specified as memory
    // string is basically array of bytes, this is why it is specified as memory
    function addPerson(string memory _name, uint256 _number) public {
        people.push(People(_number, _name));
        nameToNumber[_name] = _number;
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

- visibility types: public, private, internal, external
- View and pure functions when called alone, don't spend gas. We only spend gas when we only modify the state of a blockchain
- view functions are just for read data and disallows any modification of state
- pure function also same as 'view' function but additionally disallow you to read from blockchain state
- if a gas calling function calls a vie or pure function - only then it will cost gas
- returns(...) => what this function will give us
- every generated smart contract has addres: 0xd9145CCE52D386f254917e481eB44e9943F39138 

==================================================

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