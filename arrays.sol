// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4; 

contract ExemplosArrays{
    string [4] public Alunos; //0,1,2,3,4 -- esse é o limite 
    string[] public DisciplinaNome;//dinamico 0,1,2...
    string[][] private MatrizesDiscProf;

    //inserir nome da disciplina...

    function definirDisciplina (string memory nomeD) external {
        DisciplinaNome.push(nomeD); 
    }  

    //Excluir nome da disciplina,,,
    function deletarElemento(uint256 numeroD) external{
        delete DisciplinaNome[numeroD];
    }  
 }