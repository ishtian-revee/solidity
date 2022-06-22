// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Fund {

    function fund() public payable {
        // want to be able to set a minimum fund amount in USD

        // require() => works like a checker
        require(msg.value > 1e18, "Didn't send enough!");  // 1e18 == 1 * 10 ** 18 == 1000000000000000000 wei == 1 ETH

        // what is reverting?
        // undo any action before, and send remaining gas back
    }

    // function withdraw() {}
}

/*

NOTES:

Transactions - Value Transfer:

- Nonce: tx count for the account
- Gas Price: price per unit of gas (in wei)
- Gas Limit: 21000
- To: address that the tx is sent to
- Data: empty
- v, r, s: components of tx signature

*/