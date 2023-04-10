// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Wallet {
    struct Account {
        address accountOwner;
        uint etherBalance;
        uint accountId;
    }

    Account[] public accounts;
}