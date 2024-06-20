// SPDX-License-Identifier: MIT

pragma solidity 0.8.19; // state solidity version

import "./SimpleStorage.sol";

contract StorageFactory{

    // declare a var to hold new SimpleStorage objects
    SimpleStorage public simpleStorage;

    // create new SimpleStorage objects
    function createSimpleStorage() public {
        simpleStorage = new SimpleStorage();
    }
}

