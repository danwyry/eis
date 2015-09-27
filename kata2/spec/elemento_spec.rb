#Consigna:
#
# * Mono gana a papel
# * Mono pierde con tijera
# * Mono empata con Piedra
#
# Una vez completa la tarea, generar un TAG en el repositorio y subir a alfred el link a dicho TAG
# Fecha de entrega 30 de Septiembre

require 'rspec'
require_relative '../model/elemento'

describe 'Piedra' do
    let(:piedra) { Piedra.new() }
    let(:tijera) { Tijera.new() }
    let(:papel) { Papel.new() }
    let(:mono) { Mono.new() }

    it 'le_gana_a? Tijera devuelve true' do
        expect(piedra.le_gana_a? tijera ).to be_truthy
    end

    it 'le_gana_a? Papel devuelve false' do
        expect(piedra.le_gana_a? papel ).to be_falsey
    end

    it 'le_gana_a? Mono devuelve false' do
        expect(piedra.le_gana_a? mono).to be_falsey
    end

    it 'le_gana_a? Piedra devuelve false' do
        expect(piedra.le_gana_a? piedra).to be_falsey
    end

    it 'empata_con? Tijera devuelve false' do
        expect(piedra.empata_con? tijera).to be_falsey
    end

    it 'empata_con? Papel devuelve false' do
        expect(piedra.empata_con? papel).to be_falsey
    end

    it 'empata_con? Piedra devuelve true' do
        expect(piedra.empata_con? piedra).to be_truthy
    end

    it 'empata_con? Mono devuelve true' do
        expect(piedra.empata_con? mono).to be_truthy
    end
end

describe 'Tijera' do
    let(:tijera) { Tijera.new() }
    let(:piedra) { Piedra.new() }
    let(:papel) { Papel.new() }
    let(:mono) { Mono.new() }

    it 'le_gana_a? Tijera devuelve false' do
        expect(tijera.le_gana_a? tijera ).to be_falsey
    end

    it 'le_gana_a? Papel devuelve true' do
        expect(tijera.le_gana_a? papel ).to be_truthy
    end

    it 'le_gana_a? Mono devuelve true' do
        expect(tijera.le_gana_a? mono).to be_truthy
    end

    it 'le_gana_a? Piedra devuelve false' do
        expect(tijera.le_gana_a? piedra).to be_falsey
    end

    it 'empata_con? Tijera devuelve true' do
        expect(tijera.empata_con? tijera).to be_truthy
    end

    it 'empata_con? Papel devuelve false' do
        expect(tijera.empata_con? papel).to be_falsey
    end

    it 'empata_con? Piedra devuelve false' do
        expect(tijera.empata_con? piedra).to be_falsey
    end

    it 'empata_con? Mono devuelve false' do
        expect(tijera.empata_con? mono).to be_falsey
    end
end

describe 'Papel' do
    let(:papel) { Papel.new() }
    let(:tijera) { Tijera.new() }
    let(:piedra) { Piedra.new() }
    let(:mono) { Mono.new() }

    it 'le_gana_a? Tijera devuelve false' do
        expect(papel.le_gana_a? tijera ).to be_falsey
    end

    it 'le_gana_a? Papel devuelve true' do
        expect(papel.le_gana_a? papel ).to be_falsey
    end

#    it 'le_gana_a? Mono devuelve true' do
#        expect(papel.le_gana_a? mono).to be_truthy
#    end
#
#    it 'le_gana_a? Piedra devuelve false' do
#        expect(papel.le_gana_a? piedra).to be_falsey
#    end
#
#    it 'empata_con? Tijera devuelve true' do
#        expect(papel.empata_con? tijera).to be_truthy
#    end
#
#    it 'empata_con? Papel devuelve false' do
#        expect(papel.empata_con? papel).to be_falsey
#    end
#
#    it 'empata_con? Piedra devuelve false' do
#        expect(papel.empata_con? piedra).to be_falsey
#    end
#
#    it 'empata_con? Mono devuelve false' do
#        expect(papel.empata_con? mono).to be_falsey
#    end
end

