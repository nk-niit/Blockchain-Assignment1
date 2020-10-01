pragma solidity 0.5.16;


contract Tshirts {
    
    struct order {
        uint quantity;
        string status;
        uint price;
    }
    
    uint private order_num;
    
    mapping(uint => order) private all_orders;
    
    
    function newOrder(uint _quantity) public returns(string memory) {
        order_num++;
        all_orders[order_num] = order(_quantity, "NEW" , 0);
    }
    
    
    function verifyOrderDetails() public view returns(uint, string memory) {
        uint _quantity = all_orders[order_num].quantity;
        string memory _status = all_orders[order_num].status;
        
        return (_quantity, _status);
    }
    
    
    function acceptOrder() public returns(string memory) {
        all_orders[order_num].status = "IN PROGRESS";
        
        return ("Order accepted!");
    }
    
    
    function completeOrder(uint _cost) public {
        all_orders[order_num].status = "COMPLETE";
        all_orders[order_num].price = _cost;
    }
    
    
    function confirmPayment() public view returns(uint, string memory) {
        uint _cost = all_orders[order_num].price;
        
        return (_cost, "Payment Successfull");
    }
    
}
