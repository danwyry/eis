Feature: Operaciones basicas

  Scenario: suma
    Given un operando es 1
    And otro operando es 2
    When los sumo
    Then el resultado es 3

  Scenario: resta
    Given un operando es 2
    And otro operando es 1
    When los resto
    Then el resultado es 1

  Scenario: operacion que falla por falta de operandos
    Given no hay operandos
    When calculo el promedio
    Then resulta un error de calculo

  Scenario: promedio
    Given un operando es 1
    And otro operando es 2
    And otro operando es 6
    When calculo el promedio
    Then el resultado es 3