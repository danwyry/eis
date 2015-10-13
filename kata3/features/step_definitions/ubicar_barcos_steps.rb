require_relative '../../model/batalla_naval.rb'
# Background 

Given(/^un tablero de (\d+) x (\d+)$/) do |ancho, alto|
  @juego = BatallaNaval.new(ancho, alto)
end

Given(/^la posicion \((\d+),(\d+)\) del tablero del jugador esta ocupada$/) do |x, y|
  @jugador = 1 
  @juego.ubicar_nave(@jugador, "submarino", x, y)
end

# Scenario 1

When(/^ubico el submarino en la posicion \((\d+),(\d+)\)$/) do |x, y|
  @juego.ubicar_nave(@jugador, "submarino", x, y)
end

Then(/^el submarino queda ubicado ocupando la posicion \((\d+),(\d+)\)$/) do |x, y|
  expect(@juego.ocupado? @jugador,x,y).to be_truthy
  expect(@juego.nave_en @jugador,x,y).to be_an_instance_of Submarino
end
