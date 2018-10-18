pragma solidity ^0.4.25;

contract TNetTokenContainer {
    mapping (address => bool) internal _owners;

    address private tokenContractAddress;
    mapping (address => uint) public userBalances;

    modifier isOwner {
        require(_owners[msg.sender], "Address is not an owner");
        _;
    }

    constructor() public { _owners[msg.sender] = true; }

    function addOwner(address ownerToAdd) public isOwner {
        require(!_owners[msg.sender], "Address is already an owner");
        _owners[ownerToAdd] = true;
    }

    function removeOwner(address ownerToRemove) public isOwner {
        require(_owners[ownerToRemove], "Address is not an owner");
        _owners[ownerToRemove] = false;
    }

    function changeTokenContractAddress(address newAddress) public isOwner {
        require(tokenContractAddress != newAddress, "The new address matches the old address");
        tokenContractAddress = newAddress;
    }
}