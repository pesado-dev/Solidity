// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

interface IERC20{
    // - getters
    // Retorna a quantidade total de tokens que foram emitidos
    function totalSupply() external view returns (uint256); 
    // Retorna o saldo da carteira
    function balanceOf(address account) external view returns (uint256);
    // A função allowance retorna o valor de tokens que um determinado spender pode gastar em nome do owner
    function allowance(address owner, address spender) external view returns (uint256);
    
    // - function
    function transfer(address recipient, uint256 amount) external returns (bool);
    // A função approve gerencia permissões de gastos de tokens por outros endereços
    function approve(address spender, uint256 amount) external returns (bool);
    // A função transferFrom permite que uma terceira parte mova tokens em nome do proprietário
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    // Eventos para registrar transações e aprovações
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256); 
}

contract Diocoin is IERC20{

    string public constant name = "DIO coin";
    string public constant symbol = "DIO";
    string public constant decimals = "18";

    mapping (address => uint256) balances;
    mapping(address => mapping(address=>uint256)) allowed;
    uint256 totalSupply_ = 10 ether;

    constructor(){
        balances[msg.sender] = totalSupply_;
    }
    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }
    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }
    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender], "Saldo insuficiente");
        balances[msg.sender] -= numTokens;
        balances[receiver] += numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;   
    }
    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true; 
    }
    function allowance(address owner, address delegate) public override view returns (uint256) {
        return allowed[owner][delegate]; 
    }
    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner], "Saldo insuficiente");
        require(numTokens <= allowed[owner][msg.sender], "Valor aprovado insuficiente");

        balances[owner] -= numTokens;
        allowed[owner][msg.sender] -= numTokens;
        balances[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;  
    }
}