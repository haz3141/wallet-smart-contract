// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Wallet {
    struct Account {
        address accountOwner;
        uint etherBalance;
        uint accountId;
    }

    mapping (address => bool) depositors;
    mapping (address => Account) public accounts;
    uint private totalDeposits = 0;
    uint private totalBalance = 0;

    function depositEther() public payable {
        require(msg.value > 0, "Must deposit more than 0.");

        if (depositors[msg.sender] == false) {
            depositors[msg.sender] = true;
            Account memory newDepositor = Account(msg.sender, msg.value, totalDeposits);
            accounts[msg.sender] = newDepositor;
        } else {
            Account storage account = accounts[msg.sender];
            account.etherBalance += msg.value;
        }
    }
}