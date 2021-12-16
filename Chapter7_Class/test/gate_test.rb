require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < Minitest::Test

    def setup
        @umeda = Gate.new(:umeda)
        @juso = Gate.new(:juso)
        @mikuni = Gate.new(:mikuni)
    end

    # テスト①umedaで乗って、jusoで降りる。150円の切符を買う。(足りる)
    def test_umeda_to_juso
        ticket = Ticket.new(150)
        @umeda.enter(ticket)
        assert @juso.exit(ticket)
    end

    # テスト②umedaで乗って、mikuniで降りる。150円の切符を買う。(足りない)
    def test_umeda_to_mikuni_when_fare_is_not_enough
        ticket = Ticket.new(150)
        @umeda.enter(ticket)
        refute @mikuni.exit(ticket)
    end

    # テスト③umedaで乗って、mikuniで降りる。190円の切符を買う。(足りる)
    def test_umeda_to_mikuni_when_fare_is_enough
        ticket = Ticket.new(190)
        @umeda.enter(ticket)
        assert @mikuni.exit(ticket)
    end

    # テスト④juso乗って、mikuniで降りる。150円の切符を買う。(足りる)
    def test_juso_to_mikuni
        ticket = Ticket.new(190)
        @juso.enter(ticket)
        assert @mikuni.exit(ticket)
    end
end