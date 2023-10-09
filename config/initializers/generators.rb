# set ORM to use uuid as primary key

Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end