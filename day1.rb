# typed: strict 

class Day1 < AbstractDay
    extend T::Sig
    
    sig { override.params(input_file: String).void }
    def run_on(input_file) 
        lines = File.readlines(input_file, chomp: true)
        puts "Part 1 result: %s " % part_1(lines)
        puts "Part 2 result: %s " % part_2(lines)
    end

    VALUE_MAP = T.let({
        "one" => 1,
        "two" => 2,
        "three" => 3,
        "four" => 4,
        "five" => 5,
        "six" => 6,
        "seven" => 7,
        "eight" => 8,
        "nine" => 9,
        "1" => 1,
        "2" => 2,
        "3" => 3,
        "4" => 4,
        "5" => 5,
        "6" => 6,
        "7" => 7,
        "8" => 8,
        "9" => 9,
    }, T::Hash[String, Integer])

    sig { params(c: String).returns T::Boolean}
    def is_digit?(c)
        o = c.ord
        48 <= o && o <= 57
    end

    sig { params(lines: T::Array[String]).returns(String) }
    def part_1(lines)
        total = 0
        lines.each do |l|
            line_value = ""
            l.each_char do |c|
                if is_digit?(c)
                    if line_value.size == 0 
                        line_value = c
                    else 
                        line_value[1] = c 
                    end
                end
            end
            if line_value.size == 1 then line_value += line_value end
            total += line_value.to_i
        end

        total.to_s
    end

    sig { params(lines: T::Array[String]).returns(String) }
    def part_2(lines)
        total = 0
        lines.each do |l|
            first_match = T.must(l[/[0-9]|one|two|three|four|five|six|seven|eight|nine/])
            second_match = T.must(l.reverse[Regexp.new("[0-9]|" + "one|two|three|four|five|six|seven|eight|nine".reverse)]).reverse
            total += (VALUE_MAP[first_match].to_s + VALUE_MAP[second_match].to_s).to_i
        end

        total.to_s
    end    
end