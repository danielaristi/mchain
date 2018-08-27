require 'yaml'

config=YAML::load_file('logchain.conf')
print config['log_path']


