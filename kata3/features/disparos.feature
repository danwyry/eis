Feature: Disparos
  Como usuario
  Quiero dispararle a los barcos enemigos

  Background:
    Given un tablero de 10 x 10
    And las posiciones (5,4) y (6,4) del tablero del jugador estan ocupadas por un crucero

  # Casos de disparo y toco agua: Escenario 1

  Scenario: disparo y toco agua
    When disparo a la posicion (1,1) del tablero del jugador
    Then toca agua

  # Casos de disparo y toco pero no lo hundo: Escenario 2

  Scenario: disparo y toco pero no lo hundo
    When disparo a la posicion (5,4) del tablero del jugador
    Then el barco pasa a estar averiado en la posicion (5,4)

  Scenario: disparo y toco pero no lo hundo
    When disparo a las posiciones (5,4) y (6,4) del tablero del jugador
    Then el barco que estaba en la posicion (5,4) se considera hundido
