// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract currencyBank {
    address public minter;

    mapping(address => uint) public accounts;

    // the constructor
    constructor() {
        minter = msg.sender;
    }

    // create the money for the first time

    function mint(address reciver, uint amount) public {
        require(msg.sender == minter);
        accounts[reciver] += amount;
    }
}
