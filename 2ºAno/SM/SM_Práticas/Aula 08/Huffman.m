% Example usage:
Simbolos = ['A', 'B', 'C', 'D', 'E', 'Q', 'Z'];
Frequencia = [0.20, 0.15, 0.20, 0.10, 0.10, 0.15, 0.10];

root = buildHuffmanTree(Simbolos, Frequencia);
fprintf('Huffman Tree:\n');
printTree(root, '');

function root = buildHuffmanTree(Simbolos, frequencia)
    % Create initial nodes for each symbol and its frequency.
    nodes = arrayfun(@(s, f) HuffmanNode(s, f), Simbolos, frequencia);
    
    % Build the Huffman tree.
    while length(nodes) > 1
        % Sort nodes based on frequency.
        [~, sortedIdx] = sort(arrayfun(@(node) node.Frequency, nodes));
        nodes = nodes(sortedIdx);
        
        % Create a new node with combined frequency.
        newNode = HuffmanNode('', nodes(1).Frequency + nodes(2).Frequency);
        newNode.Left = nodes(1);
        newNode.Right = nodes(2);
        
        % Remove the two nodes with the lowest frequency.
        nodes(1:2) = [];
        
        % Add the new node to the list.
        nodes = [nodes, newNode];
    end
    
    % The last remaining node is the root of the Huffman tree.
    root = nodes(1);
end

function printTree(node, code)
    if ~isempty(node)
        if isempty(node.Left) && isempty(node.Right)
            fprintf('%s: %s\n', node.Symbol, code);
        else
            printTree(node.Left, [code, '0']);
            printTree(node.Right, [code, '1']);
        end
    end
end
