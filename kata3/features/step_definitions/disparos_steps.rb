require_relative '../../model/batalla_naval.rb'

# Background 

Given(/^las posiciones \((\d+),(\d+)\) y \((\d+),(\d+)\) del tablero del jugador estan ocupadas por un crucero$/) do |x, y, x2, y2|
  @jugador = 1 
  @juego.ubicar_nave(@jugador, "crucero", x.to_i, y.to_i)
end

When(/^disparo a la posicion \((\d+),(\d+)\) del tablero del jugador$/) do |x, y|
  @resultado_disparo = @juego.disparar @jugador, x, y 
end

Then(/^toca agua$/) do
  expect(@resultado_disparo).to be false
end


