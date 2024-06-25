// Get funds from users
// Set a min funding value in USD
// Withdraw fund to the sc owner's wallet

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minUsd = 5e18;
    // Why multiply? using getConversionRate to get the price of ETH returns a value with 18 decimal places, so minUsd needs to be in the same format
    // Solidity works with whole numbers, since ETH is represented in its min units — Wei: 1 ETH = 1 Wei * 1e18
    // Can also use 5 * 1e18 or 5 * (10 ** 18)

    address[] public funders;
    // log senders addrs
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    // add mapping for easier funder-amount search

    function fund() public payable {
        // Allow users to send money
        // Set a min USD sent (curr val 0.001 ETH)
        require(msg.value.getConversionRate() >= minUsd, "Min funding amount is 5 USD");
        funders.push(msg.sender);
        // make the sender call the func to log their addr in the funders[]
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        // add total funded to the mapping
    }

    function withdraw() public {
    // Withdraw accumulated funds to the sc owner's wallet

    }
}