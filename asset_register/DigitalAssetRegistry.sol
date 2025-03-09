// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title DigitalAssetRegistry
 * @dev A smart contract to register, verify, and transfer ownership of digital assets on the Ethereum blockchain.
 */
contract DigitalAssetRegistry {
    
    // Structure to store details of a digital asset
    struct Asset {
        string assetHash;    // Unique identifier for the digital asset (e.g., SHA-256 hash)
        address owner;       // Address of the asset's owner
        uint256 timestamp;   // The time when the asset was registered
    }

    // Mapping to store registered assets by their hash
    mapping(string => Asset) private assets;

    // Event emitted when a new asset is registered
    event AssetRegistered(string assetHash, address indexed owner, uint256 timestamp);

    // Event emitted when ownership of an asset is transferred
    event OwnershipTransferred(string assetHash, address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Registers a new digital asset.
     * The sender (msg.sender) becomes the owner of the asset.
     * @param _assetHash The unique identifier for the asset (e.g., SHA-256 hash).
     */
    function registerAsset(string memory _assetHash) public {
        // Ensure the asset hash is not empty
        require(bytes(_assetHash).length > 0, "Asset hash cannot be empty");
        
        // Ensure the asset is not already registered
        require(assets[_assetHash].owner == address(0), "Asset already registered");

        // Create a new asset and store it in the mapping
        assets[_assetHash] = Asset({
            assetHash: _assetHash,
            owner: msg.sender,        // The sender is the owner of the asset
            timestamp: block.timestamp // Current timestamp when the asset is registered
        });

        // Emit an event for asset registration
        emit AssetRegistered(_assetHash, msg.sender, block.timestamp);
    }

    /**
     * @dev Verifies an asset by returning its owner address and registration timestamp.
     * @param _assetHash The unique identifier for the asset.
     * @return owner The address of the asset owner.
     * @return timestamp The time when the asset was registered.
     */
    function verifyAsset(string memory _assetHash) public view returns (address owner, uint256 timestamp) {
        // Ensure the asset exists (i.e., it has been registered)
        require(assets[_assetHash].owner != address(0), "Asset not found");

        // Retrieve and return the asset details
        Asset memory asset = assets[_assetHash];
        return (asset.owner, asset.timestamp);
    }

    /**
     * @dev Transfers ownership of a registered asset to a new owner.
     * Only the current owner can transfer ownership.
     * @param _assetHash The unique identifier for the asset.
     * @param _newOwner The address of the new owner.
     */
    function transferOwnership(string memory _assetHash, address _newOwner) public {
        // Ensure the new owner's address is valid
        require(_newOwner != address(0), "Invalid new owner address");
        
        // Ensure only the current owner can transfer ownership
        require(assets[_assetHash].owner == msg.sender, "Only the owner can transfer ownership");

        // Get the current owner address
        address previousOwner = assets[_assetHash].owner;

        // Transfer ownership
        assets[_assetHash].owner = _newOwner;

        // Emit an event for ownership transfer
        emit OwnershipTransferred(_assetHash, previousOwner, _newOwner);
    }
}
