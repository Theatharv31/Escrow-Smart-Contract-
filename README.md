Escrow Solidity Smart Contract :-

This repository contains a Solidity-based Escrow contract that securely holds and transfers funds. The contract involves three key participants:

Depositor: The address that sends the funds to the contract.
Beneficiary: The address that receives the funds after approval.
Arbiter: The trusted third party responsible for approving the release of funds to the beneficiary.

Features:
Funds can only be released by the arbiter.
Once approved, the entire contract balance is transferred to the beneficiary.
An Approved event is emitted with the transferred balance for transparency.
