# Digital Asset Registry Smart Contract

A Solidity smart contract to register, verify, and manage digital assets on the Ethereum blockchain.

## Features

- **Register Asset**: Allows users to register digital assets with a unique hash, owner address, and timestamp.
- **Verify Asset**: Users can verify asset details using its hash.
- **Ownership Transfer**: Transfer ownership of an asset to a new Ethereum address.

## Setup & Deployment

### Prerequisites
- **MetaMask**: Install and configure MetaMask with an Ethereum test network (Ropsten/Rinkeby).
- **Remix IDE**: Use Remix for Solidity development and deployment.

### Deployment Steps
1. **Install MetaMask**: Set up a MetaMask wallet and connect to a test network.
2. **Deploy in Remix**:
   - Go to [Remix IDE](https://remix.ethereum.org/).
   - Create a new file and paste the contract code.
   - Compile using the **Solidity Compiler** tab.
   - Deploy using the **Injected Web3** environment connected to MetaMask.
   - Confirm the transaction in MetaMask.

### Interacting with the Contract
1. **Register an Asset**: Call `registerAsset(string memory assetHash)` with a unique asset hash.
2. **Verify Asset**: Call `verifyAsset(string memory assetHash)` to get asset details.
3. **Ownership Transfer**: Call `transferOwnership(string memory assetHash, address newOwner)` to transfer asset ownership.

## Known Issues
- Ensure you have enough test Ether in MetaMask for deployment and interactions.
- Testnet delays may affect transaction speeds.

This contract offers a secure way to register and verify digital assets on the blockchain. It can be extended for further features such as asset validation or frontend integration.
i
