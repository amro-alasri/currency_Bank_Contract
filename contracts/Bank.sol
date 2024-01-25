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

    error noBalnce(uint amountRequested, uint amountAvaliable);

    event Sent(address from, address receiver, uint amount);

    function mint(address reciver, uint amount) public {
        require(msg.sender == minter);
        accounts[reciver] += amount;
    }

    // Send- (money found)
    function send(address receiver, uint amount) public {
        if (amount > accounts[msg.sender])
            revert noBalnce({
                amountRequested: amount,
                amountAvaliable: accounts[msg.sender]
            });

        accounts[msg.sender] -= amount;
        accounts[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
