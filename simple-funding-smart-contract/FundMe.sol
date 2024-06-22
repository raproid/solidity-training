// Get funds from users
// Set a min funding value in USD
// Withdraw fund to the sc owner's wallet

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract FundMe {

    function fund() public payable {
        // Allow users to send money
        // Set a min USD sent (curr val 0.001 ETH)
        require(msg.value >= 1000000000000000, "Min funding amount is 0.001 ETH");

    }

    // withdraw funds to the sc owner's wallet
    function withdraw() public {

    }
}