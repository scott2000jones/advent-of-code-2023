# typed: strict
require 'sorbet-runtime'
Dir['*.rb'].each {|file| require_relative file unless file == 'runner.rb'}

extend T::Sig
sig { params(day_number: String).void }
def run(day_number)
    Module.const_get('Day' + day_number).new.run_day('input.txt')
end

ARGV.each do |i|
    run(i)
end