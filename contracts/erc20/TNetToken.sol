pragma solidity ^0.4.25;
import "./ERC20.sol";
import "./TNetTokenContainer.sol";

contract TNetToken is ERC20 {

   address public TNetTokenContainerAddress; //These names might be too long, not sure
   TNetTokenContainer public TNetContainer;

   constructor(address _TNetContainerAddress) public {
      super.constructor(); //I wonder if this will work...
      setupTNetContainer(_TNetContainerAddress);
   }

   /*
      Stuff TNetTokenContainer must implement:
      -_totalSupply
      -balances
      -allowed
  

      -totalSupply();
      -balanceOf();
      -allowance();
      -setBalanceOf(address _owner, uint256 _value); (onlyTNetToken modifier)
   */

   /* ERC20 TOKEN STANDARD FUNCTION OVERRIDES */

   function totalSupply() public view returns (uint256) {
      return TNetContainer.totalSupply();
   }

   function balanceOf(address _owner) public view returns (uint256) {
      return TNetContainer.balanceOf(_owner);
   }

   function allowance(address _owner, address _spender) public view returns (uint256) {
      return TNetContainer.allowance(_owner, _spender);
   }

   function transfer(address _to, uint256 _value) public returns (bool) {
      balance = TNetContainer.balanceOf(msg.sender);      

      require(_value <= balance);
      require(_to != address(0));

      TNetContainer.setBalanceOf(msg.sender, balance.sub(_value));
      TNetContainer.setBalanceOf(_to, TNetContainer.balanceOf(_to).add(_value));
      emit Transfer(msg.sender, _to, _value);
      return true;
   }













   function setupTNetContainer(address _addr) internal {
      TNetTokenContainerAddress = _addr;
      TNetContainer = TNetTokenContainer(TNetTokenContainerAddress);
   }



}

