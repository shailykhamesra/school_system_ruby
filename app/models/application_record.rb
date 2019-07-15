require 'active_record'
require 'yaml'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  db_config       = YAML::load(File.open('config/database.yml'))
  db_config_seed = db_config.merge({ 'schema_search_path' => 'public' })
  ActiveRecord::Base.establish_connection(db_config_seed)

end
