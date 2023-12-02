# typed: strict 

class Day1 < AbstractDay
    extend T::Sig
    
    sig { override.params(input_file: String).void }
    def run_day(input_file) 
        pp "hello i am day1"
    end
end