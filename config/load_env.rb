env_vars = File.expand_path('../environment_variables.yml', __FILE__)
env = YAML::load(File.open(env_vars))


env.each do |k,v|
    if ['development', 'test', 'production', 'feature'].include?(k)
        if k == Rails.env.downcase
            v.each do |x,y|
                ENV[x] = y
            end
        end
    else
        ENV[k] = v
    end
end 
