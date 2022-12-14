MORSE_ALPHABET = {
    '.-' =>'A',
    '-...' =>'B',
    '-.-.' =>'C',
    '-..' =>'D',
    '.' =>'E',
    '..-.' =>'F',
    '--.' =>'G',
    '....' =>'H',
    '..' =>'I',
    '.---' =>'J',
    '-.-' =>'K',
    '.-..' =>'L',
    '--' =>'M',
    '-.' =>'N',
    '---' =>'O',
    '.--.' =>'P',
    '--.-' =>'Q',
    '.-.' =>'R',
    '...' =>'S',
    '-' =>'T',
    '..-' =>'U',
    '...-' =>'V',
    '.--' =>'W',
    '-..-' =>'X',
    '-.--' =>'Y',
    '--..' =>'Z',
    '.----' =>'1',
    '..---' =>'2',
    '...--' =>'3',
    '....-' =>'4',
    '.....' =>'5',
    '-....' =>'6',
    '--...' =>'7',
    '---..' =>'8',
    '----.' =>'9',
    '-----' =>'0',
}

class TrieNode
    attr_accessor :value, :children

    def initialize value
        @value = value
        @children = {}
    end

    def add_child key, value
        @children[key] = TrieNode.new value
    end
end

class Trie
    def initialize alphabet
        @root = TrieNode.new nil
        alphabet.each {|k, v|
            insert k, v
        }  
    end

    def insert word, value
        node = @root
        word.each_char {|c|
            node.add_child c, nil unless node.children.include? c
            node = node.children[c]
        }
        node.value = value
    end

    def get word
        node = @root
        word.each_char {|c|
            node = node.children[c]
        }
        node.value
    end
end


t = Trie.new MORSE_ALPHABET
p t.get '-..-'
