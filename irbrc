### Load plugins
%w{rubygems pp irb/completion irb/ext/save-history}.each do |lib|
  begin
    require lib
  rescue LoadError => err
    $stderr.puts "Couldn't load #{lib}: #{err}"
  end
end

### Prompt behavior
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

### History
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

### Alias exit
alias q exit

### Custom methods
def ls
  %x{ls}.split("\n")
end

### Core extensions
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
  alias :lm :local_methods
end

class Class
  def class_methods
    (methods - Class.instance_methods - Object.methods).sort
  end
  alias :cm :class_methods

  def defined_methods
    methods = {}

    methods[:instance] = new.local_methods
    methods[:class] = class_methods

    methods
  end
  alias :dm :defined_methods
end

### Notify Ruby version
puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} #{RUBY_PLATFORM}"