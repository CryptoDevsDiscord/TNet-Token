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

   function setupTNetContainer(address _addr) internal {
      TNetTokenContainerAddress = _addr;
      TNetContainer = TNetTokenContainer(TNetTokenContainerAddress);
   }


}

