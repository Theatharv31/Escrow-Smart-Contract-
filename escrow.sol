// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // Declare the Approved event that logs the transferred balance
    event Approved(uint balance);

    // Constructor to set the arbiter, beneficiary, and depositor addresses
    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    // External function to approve the transfer of funds to the beneficiary
    function approve() external {
        // Only allow the arbiter to approve the transfer
        require(msg.sender == arbiter, "Only the arbiter can approve");

        // Store the current contract balance before transferring
        uint contractBalance = address(this).balance;

        // Emit the Approved event with the current balance
        emit Approved(contractBalance);

        // Transfer the contract's balance to the beneficiary
        (bool success, ) = beneficiary.call{value: contractBalance}("");
        require(success, "Transfer failed");
    }
}
