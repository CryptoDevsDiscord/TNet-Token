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
      -setAllowed(address _owner, address _spender, uint256 _value)
      -allowed(address _owner, address _spender)
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


   function approve(address _spender, uint256 _value) public returns (bool) {
      require(_spender != address(0));

      //allowed[msg.sender][_spender] = _value;
      TNetContainer.setAllowed(msg.sender, _spender, _value);
      emit Approval(msg.sender, _spender, _value);
      return true;
   }


   function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
      balanceFrom = TNetContainer.balanceOf(_from);
      balanceTo = TNetContainer.balanceOf(_to);

      require(_value <= balanceFrom);
      //require(_value <= allowed[_from][msg.sender]); I wonder if a contract can get a mapping...? It'd probably be too expensive
      require(_value <= TNetContainer.allowance(_from, msg.sender);
      require(_to != address(0));

      TNetContainer.setBalanceOf(_from, balanceFrom.sub(_value));
      TNetContainer.setBalanceOf(_to, balanceTo.add(_value);
      TNetContainer.setAllowed(_from, msg.sender, TNetContainer.allowance(_from, msg.sender).sub(_value);
      emit Transfer(_from, _to, _value);
      return true;
   }


   function increaseAllowance(address _spender, uint256 _addedValue) public returns (bool) {
      require(_spender != address(0));

      TNetContainer.setAllowance(msg.sender, _spender, TNetContainer.allowance(msg.sender, _spender).add(_addedValue)));
      emit Approval(msg.sender, _spender, TNetContainer.allowance(msg.sender, _spender));
      return true;
   }


   function decreaseAllowance(address _spender, uint256 _subtractedValue) public returns (bool) {
      require(_spender != address(0));

      TNetContainer.setAllowance(msg.sender, _spender, (TNetContainer.allowance(msg.sender, _spender).sub(_subtractedValue));
      emit Approval(msg.sender, _spender, TNetContainer.allowance(msg.sender, _spender);
      return true;
   }


   function _mint(address _account, uint256 _amount) internal {
      require(_account != 0);
      require(totalSupply().add(_amount) <= maxSupply);
      TNetContainer.setTotalSupply(totalSupply().add(_amount));
      TNetContainer.setBalanceOf(_account, TNetContainer.balanceOf(_account).add(_amount));
      emit Transfer(address(0), _account, _amount);
   }


   function _burn(address _account, uint256 _amount) internal {
      require(_account != 0);
      require(_amount <= TNetContainer.balanceOf(_account);

      TNetContainer.setTotalSupply(totalSupply().sub(_amount));
      TNetContainer.setBalanceOf(_account, TNetContainer.balanceOf(_account).sub(_amount));

      emit Transfer(_account, address(0), _amount);
   }




   function setupTNetContainer(address _addr) internal {
      TNetTokenContainerAddress = _addr;
      TNetContainer = TNetTokenContainer(TNetTokenContainerAddress);
   }



}

