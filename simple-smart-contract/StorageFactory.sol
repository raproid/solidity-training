// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19; // state solidity version

import "./SimpleStorage.sol";

contract StorageFactory{

    // declare a var to hold the addr of a new SimpleStorage instance
    SimpleStorage public simpleStorage;

    // declare a dynamic array of SimpleStorage contracts
    SimpleStorage[] public  listOfSimpleStorageContracts;

    // create new SimpleStorage instance
    function createSimpleStorage() public {
        simpleStorage = new SimpleStorage();
    }

    // push SimpleStorage contracts into SimpleStorage[]
    function createSimpleStorageAndAddToArray() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    // store a number in the array
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    // get a number by the index from the array
    function sfGet(uint256 _simpleStorageIndex)public view returns(uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }

}

