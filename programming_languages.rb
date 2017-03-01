def reformat_languages(languages)
  new_hash = {}

  languages.each do |style_name, name|
    name.each do |program, types|
      types.each do |type, type_name|
        if new_hash[program] != nil
          new_hash[program][:style] << style_name
        else
          new_hash[program] = {type => type_name, :style => [style_name]}
        end
      end
    end
  end

  new_hash
end


# input => languages = {:oo => {:ruby => {:type => "interpreted"},:javascript => {:type => "interpreted"},:python => {:type => "interpreted"},:java => {:type => "compiled"}},
#              :functional => {:clojure => {:type => "compiled"},:erlang => {:type => "compiled"},:scala => {:type => "compiled"}, :javascript => {:type => "interpreted"}}}
#
# output => result = {:ruby => {:type => "interpreted",:style => [:oo]},:javascript => {:type => "interpreted",:style => [:oo, :functional]},:python => {:type => "interpreted",:style => [:oo]},:java => {:type => "compiled",:style => [:oo]},:clojure => {:type => "compiled",:style => [:functional]},:erlang => {:type => "compiled",:style => [:functional]},:scala => {:type => "compiled",:style => [:functional]}}
