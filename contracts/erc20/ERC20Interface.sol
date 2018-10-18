// ----------------------------------------------------------------------------

// ERC Token Standard #20 Interface

// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md

// (Note: Also incorporates some elements from OpenZeppelin standard: https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/token/ERC20/IERC20.sol)

// ----------------------------------------------------------------------------

pragma solidity ^0.4.25;

interface ERC20Interface {

   function totalSupply() external view returns (uint256);
   function balanceOf(address _owner) external view returns (uint256 balance);
   function transfer(address _to, uint256 _value) external returns (bool success);
   function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
   function approve(address _spender, uint256 _value) external returns (bool success);
   function allowance(address _owner, address _spender) external view returns (uint256 remaining);

   event Transfer(address indexed _from, address indexed _to, uint256 _value);
   event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}
