// Get funds from users
// Set a min funding value in USD
// Withdraw fund to the sc owner's wallet

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FundMe {

    uint256 public minUSD = 5;

    function fund() public payable {
        // Allow users to send money
        // Set a min USD sent (curr val 0.001 ETH)
        require(msg.value >= minUSD, "Min funding amount is 4 USD");

    }


    function withdraw() public {
    // Withdraw accumulated funds to the sc owner's wallet

    }
}