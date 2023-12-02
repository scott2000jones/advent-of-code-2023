# typed: strict
require "sorbet-runtime"
Dir["*.rb"].each {|file| require_relative file unless file == "runner.rb"}

extend T::Sig
sig { params(day_number: String, livemode: T::Boolean).void }
def run_day(day_number, livemode)
    puts "Running day %s ... " % day_number
    input_file = if livemode then "inputs/" + day_number + ".txt" else "inputs/" + day_number + ".test.txt" end
    Module.const_get("Day" + day_number).new.run_on(input_file)
    puts
end

extend T::Sig
sig { void }
def print_usage()
    puts "Usage: "
    puts "To run all days: "
    puts "  ruby runner.rb all"
    puts "Example to run specific days: "
    puts "  ruby runner.rb 1 2 3"
end

if ARGV.size < 1 || (ARGV[0] != "testmode" && ARGV[0] != "livemode")
    print_usage
    exit
else
    livemode = ARGV[0] == "livemode"
end

if ARGV.size == 2 && ARGV[1] == "all"
    # Run all days
    (Dir["*.rb"].size - 2).times do |i|
        run_day((i+1).to_s, livemode)
    end
elsif ARGV.size > 1
    ARGV.each do |s|
        run_day(s, livemode)
    end
else
    print_usage
end