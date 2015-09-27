require 'rspec'
require_relative '../model/jugada'
require_relative '../model/jugador'
require_relative '../model/elemento'

describe 'Jugada' do
    let(:jugada) { Jugada.new(Jugador.new, Tijera) }
    let(:jugada_que_empata) { Jugada.new(Jugador.new, Tijera) }
    let(:jugada_que_pierde) { Jugada.new(Jugador.new, Papel) }
    let(:jugada_que_gana) { Jugada.new(Jugador.new, Piedra) }

    it 'jugada se inicializa con un jugador' do
        expect(jugada.jugador).to be_a_kind_of Jugador
    end

    it 'jugada se inicializa con un elemento' do
        expect(jugada.elemento).to be_a_kind_of Elemento
    end

    it 'empata_con? jugada_que_empata devuelve true si los elementos de ambas jugadas empatan' do
        expect(jugada.empata_con? jugada_que_empata).to be_truthy
    end

    
    it 'empata_con? jugada_que_pierde devuelve false si el elemento de jugada_que_pierde pierde contra la propia' do
        expect(jugada.empata_con? jugada_que_empata).to be_truthy
    end
end
