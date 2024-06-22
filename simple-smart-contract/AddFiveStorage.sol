// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage.sol} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {

    // override the store() func from SimpleStorage.sol and make it +5 to any stored number
    function store(uint256 _newNumber) public override {
        myFavouriteNumber = _newNumber + 5;
    }
}