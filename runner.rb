# typed: strict
require "sorbet-runtime"
Dir["*.rb"].each {|file| require_relative file unless file == "runner.rb"}

extend T::Sig
sig { params(day_number: String).void }
def run_day(day_number)
    puts "Running day %s ... " % day_number
    Module.const_get("Day" + day_number).new.run_day("inputs/" + day_number + ".txt")
    puts
end

if ARGV.size == 1 && ARGV[0] == "all"
    # Run all days
    (Dir["*.rb"].size - 2).times do |i|
        run_day((i+1).to_s)
    end
elsif ARGV.size != 0
    ARGV.each do |s|
        run_day(s)
    end
else
    puts "Usage: "
    puts "To run all days: "
    puts "  ruby runner.rb all"
    puts "Example to run specific days: "
    puts "  ruby runner.rb 1 2 3"
end