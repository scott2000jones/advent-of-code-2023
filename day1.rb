# typed: strict 

class Day1 < AbstractDay
    extend T::Sig
    
    sig { override.params(input_file: String).void }
    def run_day(input_file) 
        lines = File.readlines(input_file, chomp: true)
        puts "Part 1 result: %s " % part_1(lines)
    end

    sig { params(lines: T::Array[String]).returns(String) }
    def part_1(lines)
        'tbd'
    end
end