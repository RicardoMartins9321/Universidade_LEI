classdef HuffmanNode
    properties
        Symbol
        Frequency
        Left
        Right
    end
    
    methods
        function obj = HuffmanNode(symbol, frequency)
            obj.Symbol = symbol;
            obj.Frequency = frequency;
            obj.Left = [];
            obj.Right = [];
        end
    end
end