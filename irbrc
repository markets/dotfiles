#!/usr/bin/ruby

# Load plugins
%w{rubygems pp irb/completion irb/ext/save-history}.each do |lib|
  begin
    require lib
  rescue LoadError => err
    $stderr.puts "Couldn't load #{lib}: #{err}"
  end
end

# Prompt behavior
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

# History
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Custom methods and aliases
alias q exit

def ls
  %x{ls}.split("\n")
end

def r
  reload!
end

def clear
  system 'clear'
end
alias c clear

# Quick benchmarking
# Usage: bm { rand } or quick(1000) { rand }
def bm(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bmbm do |b|
    b.report { repetitions.times &block }
  end
end

# Core extensions
class Object
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  alias :lm :local_methods

  # Print documentation
  # Usage: ri 'Array#pop' or Array.ri or Array.ri(:sort)
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

# Notify Ruby version
puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} #{RUBY_PLATFORM}"