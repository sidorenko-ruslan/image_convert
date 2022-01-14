set :stage, :production
set :rails_env, :production
set :branch, "main"
server "3.144.188.47", user: "ubuntu", roles: %w{web app db}