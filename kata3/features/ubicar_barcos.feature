Feature: Ubicar barcos
  Como usuario
  Quiero ubicar mis barcos

  Background:
    Given un tablero de 10 x 10
    And la posicion (5,5) del tablero del jugador esta ocupada

  # Casos de éxito: Escenario 1

  Scenario: ubico un submarino con exito
    When ubico el submarino en la posicion (1,1)
    Then el submarino queda ubicado ocupando la posicion (1,1)

  Scenario: ubico un crucero horizontalmente en el tablero con exito
    When ubico el crucero horizontalmente en la posicion (1,2)
    Then el crucero queda ubicado ocupando las posiciones (1,2) y (2,2)

  Scenario: ubico un crucero verticalmente en el tablero con exito
    When ubico el crucero verticalmente en la posicion (1,10)
    Then el crucero queda ubicado ocupando las posiciones (1,10) y (1,9)

  Scenario: ubico un destructor horizontalmente en el tablero con exito
    When ubico el destructor horizontalmente en la posicion (1,3)
    Then el destructor queda ubicado ocupando las posiciones (1,3), (2,3) y (3,3)

  Scenario: ubico un destructor verticalmente en el tablero con exito
    When ubico el destructor verticalmente en la posicion (2,10)
    Then el destructor queda ubicado ocupando las posiciones (2,10), (2,9) y (2,8)

  # Casos de error: Escenario 2

  Scenario: ubico un submarino en una posicion ya ocupada y falla
    When ubico el submarino en la posicion (5,5)
    Then el submarino no queda ubicado y se genera un error de posicion ocupada
  @wip
  Scenario: ubico un crucero en una posicion donde alguno de los lugares que este vaya a ocupar, ya este ocupado y falla
    When ubico un crucero en la posicion (4,5)
    Then el crucero no queda ubicado y se genera un error de posicion ocupada


  @wip
  Scenario: ubico un destructor en una posicion donde alguno de los lugares que este vaya a ocupar, ya este ocupado y falla
    When ubico un destructor horizontalmente en la posicion (4,5)
    Then el destructor no queda ubicado y se genera un error de posicion ocupada

  # Casos de error: Escenario 3

  @wip
  Scenario: ubico una nave (cualquiera sea) fuera del tablero y falla
    Given la posicion (11,1) no esta ocupada
    When ubico la nave en la posicion (11,1)
    Then la nave no queda ubicada en el tablero 
  @wip
  Scenario: ubico un crucero en una posicion en la que no cabe la completitud de la nave y falla
    Given la posicion (10,1) no esta ocupada
    When ubico el crucero horizontalmente en la posicion (10,1)
    Then el crucero no queda ubicado en el tablero 
  @wip
  Scenario: ubico un destructor en una posicion en la que no cabe la completitud de la nave y falla
    Given las posiciones (9,1) y (10,1) no estan ocupadas
    When ubico un destructor horizontalmente en la posicion (9,1)
    Then el destructor no queda ubicado en el tablero 
