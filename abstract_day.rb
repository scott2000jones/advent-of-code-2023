# typed: strict

class AbstractDay 
    extend T::Sig
    extend T::Helpers
    abstract!

    sig { abstract.params(input_file: String).void }
    def run_day(input_file); end
end